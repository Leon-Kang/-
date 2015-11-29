//
//  SquareViewController.m
//  田字格
//
//  Created by 康梁 on 15/11/26.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 问题：转屏幕时如果图片超出边缘会消失
    // 思考：如何将控件根据屏幕来变换大小
    // 解决：使用代码直接取[[NSScreen mainScreen] bounds]然后根据屏幕直接计算出控件大小可以解决，但是
    // 答疑：使用自动布局是否有简单方法。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
