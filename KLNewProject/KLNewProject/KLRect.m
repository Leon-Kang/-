//
//  KLRect.m
//  KLNewProject
//
//  Created by 康梁 on 15/11/11.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLRect.h"


@interface KLRect ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation KLRect

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


	


- (void)drawRect:(CGRect)rect {
    CGRect bouns = self.bounds;
    CGPoint center;
    center.x = bouns.origin.x + bouns.size.width/2.0;
    center.y = bouns.origin.y + bouns.size.height/2.0;
    
    float maxRadius = hypotf(bouns.size.width, bouns.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currenRadius = maxRadius; currenRadius > 0; currenRadius -= 20) {
        
        [path moveToPoint: CGPointMake(center.x + currenRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currenRadius
                    startAngle:0.0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
//    self.backgroundColor = [UIColor redColor];
//    [self.backgroundColor setStroke];
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"%@ is touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                        green:green
                                         blue:blue
                                        alpha:1];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
