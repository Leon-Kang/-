//
//  KLViewController.m
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "KLViewController.h"
#import "KLAViewController.h"

@interface KLViewController () <UITabBarControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//    NSDictionary *dic = [[NSDictionary alloc] init];
//    NSDictionary *dic2 = [[NSDictionary alloc] init];
//    NSArray *arr = [[NSArray alloc] init];
//    
//    arr = @[dic2];
//    
//    dic = @{@"arr": arr};
//    
//    NSArray *arr2 = [dic objectForKey:@"arr"];
//    NSDictionary *dic3 = arr2[0];
    

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 发出广播
    NSString *name = @"Leon-Kang";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"name" object:name];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonActive:(id)sender {
    KLAViewController *aViewC = [[KLAViewController alloc] init];
    // 拿到block传的值
    
    [aViewC returnText:^(NSString *text) {
        self.textLabel.text = text;
    }];
    
    [self presentViewController:aViewC animated:YES completion:nil
     ];
    
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
