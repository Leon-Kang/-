//
//  ViewController.m
//  协议
//
//  Created by 康梁 on 15/11/18.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark -----textfield部分
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 70, 140, 30)];
    
    // textField.backgroundColor = [UIColor orangeColor];
    // 设置边框
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // 设置键盘
    textField.placeholder = @"Hypnotize me !";
    textField.returnKeyType = UIReturnKeyDone;
    // delegate = self
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
    
#pragma mark ------UILabel部分
    CGRect labelRect = CGRectMake(40, 100, 140, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    
    label.text = @"A and b";
    label.backgroundColor = [UIColor orangeColor];
    label.highlightedTextColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(2, 2);
    
    [self.view addSubview:label];
    
    
#pragma mark ------崩溃调试
//    NSString *str;
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    [array addObject:str];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSString *str = textField.text;
//    NSLog(@"%@", str);
//    return YES;
//}

- (void)drawMessage:(NSString *)message {
    CGRect labelRect = CGRectMake(40, 100, 140, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    
    label.text = message;
    
    label.backgroundColor = [UIColor orangeColor];
    label.highlightedTextColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(2, 2);
    
    // 自适应
    [label sizeToFit];
    
    [self.view addSubview:label];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *str = textField.text;
    NSLog(@"%@", str);
    [self drawMessage:str];
    
    return YES;
}




@end
