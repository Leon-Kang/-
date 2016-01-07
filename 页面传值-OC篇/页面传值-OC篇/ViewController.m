//
//  ViewController.m
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self.myTextField selector:@selector(myTextFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    self.myTextField.backgroundColor = [UIColor brownColor];
    self.myTextField.placeholder = @"输入点啥吧···";
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(printName:) name:@"name" object:nil];
    
    
}


- (void)printName:(NSNotification *)notifaction {
    NSString *name = notifaction.object;
    NSLog(@"%@", name);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)myTextFieldChange:(NSNotification *)notification
{
    self.myTextField = notification.object;
    NSLog(@"%@", self.myTextField.text);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"ViewController";
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
