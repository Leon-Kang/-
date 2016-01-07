//
//  KLViewController.m
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "KLViewController.h"
#import "KLAViewController.h"
#import "PassValueDelegate.h"

@interface KLViewController () <PassValueDelegate>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 发出广播
    NSString *name = @"Leon-Kang";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"name" object:name];
    
    
}


- (IBAction)buttonActive:(id)sender {
    KLAViewController *aViewC = [[KLAViewController alloc] init];
    // 拿到block传的值
    
    [aViewC returnText:^(NSString *text) {
        self.textLabel.text = text;
    }];
    
    aViewC.delegate = self;
    
    [self presentViewController:aViewC animated:YES completion:nil
     ];
    
}

#pragma mark - PassValueDelegate
- (void)passValue:(NSString *)value
{
    self.valueLabel.text = value;
}


@end
