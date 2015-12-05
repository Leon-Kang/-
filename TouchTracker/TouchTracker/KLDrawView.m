//
//  KLDrawView.m
//  TouchTracker
//
//  Created by 康梁 on 15/11/27.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLDrawView.h"
#import "KLLine.h"

@interface KLDrawView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) KLLine *currentLine;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;

@property (nonatomic, weak) KLLine *selectedLine;

@property (nonatomic, strong) UIPanGestureRecognizer *moveRecognizer;

@end

@implementation KLDrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        // 打开多点触控
        self.multipleTouchEnabled = YES;
        
        // 实现手势部分
        // 两次点击
        UITapGestureRecognizer *doubleTapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        doubleTapRecognize.numberOfTapsRequired = 2;
        doubleTapRecognize.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognize];
        
        // 一次点击
        UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapRecognize.delaysTouchesBegan = YES;
        // 判断是否是双击手势，如果不是再执行单击方法
        [tapRecognize requireGestureRecognizerToFail:doubleTapRecognize];
        [self addGestureRecognizer:tapRecognize];
        
        // 长按
        UILongPressGestureRecognizer *pressRecognize = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:pressRecognize];
        
        self.moveRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
        self.moveRecognizer.delegate = self;
        self.moveRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:self.moveRecognizer];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    [[UIColor blackColor] set];
    
    for (KLLine *line in self.finishedLines) {
        // [self strokeLine:line];
        [self strokeCircle:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeCircle:self.linesInProgress[key]];
    }
    
    if (self.selectedLine) {
        [[UIColor greenColor] set];
        [self strokeCircle:self.selectedLine];
    }
    
//    if (self.currentLine) {
//        [[UIColor redColor] set];
//        // [self strokeLine:self.currentLine];
//        [self strokeCircle:self.currentLine];
//    }
}

#pragma mark -------协议方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.moveRecognizer) {
        return YES;
    }
    return NO;
}

#pragma mark -------手势方法
// 双击
- (void)doubleTap:(UIGestureRecognizer *)gr {
    NSLog(@"Recognized Double Tap");
    
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
}

// 长按
- (void)longPress:(UIGestureRecognizer *)gr {
    if (gr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gr locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        
        if (self.selectedLine) {
            [self.linesInProgress removeAllObjects];
        }else if (gr.state == UIGestureRecognizerStateEnded) {
            self.selectedLine = nil;
        }
        
        [self setNeedsDisplay];
    }
}

- (void)moveLine:(UIPanGestureRecognizer *)gr {
    // 如果没有选中线条就直接返回
    if (!self.selectedLine) {
        return;
    }
    
    // 如果UIPanGestureRecognizer对象处于『变化后』的状态
    if (gr.state == UIGestureRecognizerStateChanged) {
        // 获取手指的拖移距离
        CGPoint translation = [gr translationInView:self];
        
        // 将拖移距离加至选中的线条的起点和终点
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        begin.x += translation.x;
        begin.y += translation.y;
        end.x += translation.x;
        end.y += translation.y;
        
        // 为选中的线条设置新的起点和终点
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        [self.linesInProgress removeAllObjects];
        // 重画视图
        [self setNeedsDisplay];
        
        [gr setTranslation:CGPointZero inView:self];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

// 点击
- (void)tap:(UIGestureRecognizer *)gr {
    NSLog(@"Recognized Tap");
    
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    if (self.selectedLine) {
        // 使视图成为UIMenuItem动作消息的目标
        [self becomeFirstResponder];
        
        // 获取UIMenuController对象
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        // 创建一个新的标题为『Delete』的UIMenuItem对象
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        menu.menuItems = @[deleteItem];
        
        // 先为UIMenuController对象设置显示区域，然后将其设置为可见
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
        
    }else {
        // 如果没有选中线条，就隐藏UIMenuController对象
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    }
    
    [self setNeedsDisplay];
}

- (void)deleteLine:(id)sender {
    // 从已经完成的线条中删除选中的线条
    [self.finishedLines removeObject:self.selectedLine];
    // 重画整个视图
    [self setNeedsDisplay];
}

- (KLLine *)lineAtPoint:(CGPoint)p {
    // 找出离p最近的KLLine对象
    for (KLLine *line in self.finishedLines) {
        
        // 算法优化，算出每个圆的半径。然后根据半径找出两个同心圆，同心圆半径差为画出的圆的线条宽度。即可包围住所有圆上的点。
        float currenRadius = sqrtf(powf(line.end.y - line.begin.y, 2) + powf(line.end.x - line.begin.x, 2));
        NSLog(@"%f",currenRadius);
        NSLog(@"%f", hypotf(p.x - line.begin.x, p.y - line.begin.y));
        
        // 如果线条的某个点和p距离在20点以内，就返回相应的KLLine对象
        if (hypotf(p.x - line.begin.x, p.y - line.begin.y) <= currenRadius + 5 &&
            hypotf(p.x - line.begin.x, p.y - line.begin.y) >= currenRadius - 5) {
            return line;
        }
    }
    // 如果没有找到符合条件的线条，就返回nil，代表不选择任何线条
    return nil;
}

#pragma mark -------画各种形状的函数编写
// 画线条
- (void)strokeLine:(KLLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}
// 画圆
- (void)strokeCircle:(KLLine *)line {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float currenRadius = sqrtf(powf(line.end.y - line.begin.y, 2) + powf(line.end.x - line.begin.x, 2));
    
    [path moveToPoint:CGPointMake(line.begin.x + currenRadius, line.begin.y)];
    
    [path addArcWithCenter:line.begin
                    radius:currenRadius
                startAngle:0.0
                  endAngle:M_PI * 2
                 clockwise:YES];
    
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapSquare;
    [path stroke];
    
}


#pragma mark -----获取数据三方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 向控制台输出日志，查看触摸事件发生顺序
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        KLLine *line = [[KLLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
        
    }
    
//    UITouch *t = [touches anyObject];
//    // 根据触摸位置创建KLLine对象
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine = [[KLLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        KLLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView:self];
    }
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        KLLine *line = self.linesInProgress[key];
        
        if (line) {
            [self.finishedLines addObject:line];
            [self.linesInProgress removeObjectForKey:key];
        }
      
    }
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
//    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}



@end
