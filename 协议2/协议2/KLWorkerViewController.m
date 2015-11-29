//
//  KLWorkerViewController.m
//  协议2
//
//  Created by 康梁 on 15/11/18.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLWorkerViewController.h"
#import "KLManagerViewController.h"
#import "JobDelegate.h"

@interface KLWorkerViewController () <JobDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *workerLabel;

@property (weak, nonatomic) IBOutlet UITextField *workerTextField;

@end

@implementation KLWorkerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
/*  CGRect bounds = [[UIScreen mainScreen] bounds];
    CGRect textBounds;
    textBounds.size = CGSizeMake(140, 50);
    textBounds.origin.y = (bounds.size.height / 2.0) - (textBounds.size.height / 2.0);
    textBounds.origin.x = (bounds.size.width / 2.0) - (textBounds.size.width / 2.0);
    
    UITextField *textField = [[UITextField alloc] initWithFrame:textBounds];
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField]; */
    
    self.workerLabel.text = @"I am a worker !";
    [self.workerLabel sizeToFit];
    
#pragma mark ------设置textfield
    self.workerTextField.placeholder = @"输入···";
    self.workerTextField.returnKeyType = UIReturnKeyDone;
    self.workerTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark ------切换到manager button对应方法
- (IBAction)goToManager:(id)sender {
    KLManagerViewController *manager = [[KLManagerViewController alloc] initWithNibName:@"KLManagerViewController" bundle:nil];
    
    manager.delegate = self;
    
    [self presentViewController:manager animated:YES completion:nil];

}

#pragma mark -------协议必须调用方法
- (void)passValue:(NSString *)value {
    [self drawWorkerTextFieldToUILabel:value];
}

#pragma mark -------随机画UILabel方法
- (void)drawWorkerTextFieldToUILabel:(NSString *)str
{
    for (int i = 0; i < 10; i++) {
        UILabel *randomLabel = [[UILabel alloc] init];
        
        // 设置UILabel
        CGFloat randomRed = (arc4random() % 100) / 100.0;
        CGFloat randomGreen = (arc4random() % 100) / 100.0;
        CGFloat randomBlue = (arc4random() % 100) / 100.0;
        UIColor *randomClolor = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1];
        randomLabel.backgroundColor = randomClolor;
        
        randomLabel.textColor = [UIColor orangeColor];
        randomLabel.text = str;
        
        // label自适应
        [randomLabel sizeToFit];
        
        // 随机x，y
        int width = (int)(self.view.bounds.size.width - randomLabel.bounds.size.width);
        int height = (int)(self.view.bounds.size.height - randomLabel.bounds.size.height);
        int x = arc4random() % width;
        int y = arc4random() % height;
        
        // 设置frame
        CGRect labelFrame = randomLabel.frame;
        labelFrame.origin = CGPointMake(x, y);
        randomLabel.frame = labelFrame;
        
        
        [self.view addSubview:randomLabel];
    
    }
}

#pragma mark -------TextField协议方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawWorkerTextFieldToUILabel:self.workerTextField.text];
    return YES;
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
