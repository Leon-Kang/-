//
//  ViewController.m
//  block test 2
//
//  Created by 康梁 on 15/11/30.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

void printMessage () {
    NSLog(@"Hello World");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block int foo = 0;
    
    
    void (^printMessage)(void);
    printMessage = ^(void)
    {
        NSLog(@"Hello World * %d", ++foo);
    };

    printMessage();
    
    
    float (^area)(float, float);
    area = ^(float length, float width)
    {
        return length * width;
    };
    
    float a = area(25.0, 55.0);
    NSLog(@"%f", a);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
