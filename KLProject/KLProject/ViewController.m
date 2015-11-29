//
//  ViewController.m
//  KLProject
//
//  Created by 康梁 on 15/11/16.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import "KLReminderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KLReminderViewController *remind = [[KLReminderViewController alloc] init];
    
    [self.view addSubview:remind.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
