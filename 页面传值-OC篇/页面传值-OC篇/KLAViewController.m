//
//  KLAViewController.m
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "KLAViewController.h"

@interface KLAViewController () <UITabBarControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation KLAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTextField.backgroundColor = [UIColor brownColor];
    self.myTextField.placeholder = @"输入点啥吧···";
    self.myTextField.secureTextEntry = YES;
    self.myTextField.clearsOnBeginEditing = YES;

    // 监听textField输入
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:self.myTextField];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 注册为观察者，接听名为『name』的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(printName:) name:@"name" object:nil];
}

/**
 *    @author kl, 16-01-07 17:01:53
 *
 *    @brief 监听执行方法
 *
 *    @param notifaction notifaction
 */
- (void)printName:(NSNotification *)notifaction {
    NSString *name = notifaction.object;
    NSLog(@"%@", name);
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)textChange:(NSNotification *)notifaction {
    NSLog(@"%@", ((UITextField *)notifaction.object).text);
}

- (void)returnText:(returnTextBlock)textBlock
{
    self.returnTextBlock = textBlock;
}



- (IBAction)buttonAction:(id)sender {
    self.returnTextBlock(self.myTextField.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
