//
//  ViewController.m
//  KLMoonLight.2
//
//  Created by 康梁 on 15/11/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    UIButton *lightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lightBtn.frame = CGRectMake(0, 0, 120, 40);
    lightBtn.center = CGPointMake(bounds.size.width / 2.0, bounds.size.height / 2.0);
    
    [lightBtn setTitle:@"Open" forState:UIControlStateNormal];
    [lightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [lightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [lightBtn addTarget:self action:@selector(openOrClose:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lightBtn];
    
    self.capDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 判断是否有闪光灯功能
    if (![self.capDevice hasTorch]) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"" message:@"当前设备没有闪光灯" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alter show];
        
        [lightBtn setEnabled:NO];
    }
    
    self.isLightOn = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openOrClose:(UIButton *)button {
    if (self.isLightOn) {
        [self turnOnTorch:NO];
        self.isLightOn = NO;
        [button setSelected:NO];
    } else {
        [self turnOnTorch:YES];
        self.isLightOn = YES;
        [button setSelected:YES];
    }
}

// 是否打开手电
- (void)turnOnTorch:(BOOL)on {
    [self.capDevice lockForConfiguration:nil];
    if (on) {
        [self.capDevice setTorchMode:AVCaptureTorchModeOn];
    }else {
        [self.capDevice setTorchMode:AVCaptureTorchModeOff];
    }
    [self.capDevice unlockForConfiguration];
}

@end
