//
//  KLManagerViewController.m
//  协议2
//
//  Created by 康梁 on 15/11/18.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLManagerViewController.h"
#import "KLWorkerViewController.h"



@interface KLManagerViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *managerLabel;
@property (weak, nonatomic) IBOutlet UITextField *managerTextField;

@end

@implementation KLManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.managerLabel.text = @"I am a manager!";
    [self.managerLabel sizeToFit];
    
    self.managerTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToWorker:(id)sender {
    [self.delegate passValue:self.managerTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.message = self.managerTextField.text;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.message = self.managerTextField.text;
    [self drawManagerRandomLable:self.message];
    return YES;
}

- (void)drawManagerRandomLable:(NSString *)str
{
    for (int i = 0; i < 10; i++) {
        UILabel *managerLable = [[UILabel alloc] init];
        
        managerLable.backgroundColor = [UIColor redColor];
        managerLable.textColor = [UIColor blackColor];
        managerLable.text = str;
        
        [managerLable sizeToFit];
        
        int width = (int)(self.view.bounds.size.width - managerLable.bounds.size.width);
        int height = (int)(self.view.bounds.size.height - managerLable.bounds.size.height);
        int x = arc4random() % width;
        int y = arc4random() % height;
        
        // 设置frame
        CGRect labelFrame = managerLable.frame;
        labelFrame.origin = CGPointMake(x, y);
        managerLable.frame = labelFrame;
        
        [self.view addSubview:managerLable];
    }
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
