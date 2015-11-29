//
//  KLReminderViewController.m
//  KLProject
//
//  Created by 康梁 on 15/11/16.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLReminderViewController.h"

@interface KLReminderViewController ()
@property (weak, nonatomic) IBOutlet UIButton *reminde;

@end

@implementation KLReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addReminder:(id)sender {
    NSLog(@"sendMSG");
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
