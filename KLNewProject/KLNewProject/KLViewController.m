//
//  KLViewController.m
//  KLNewProject
//
//  Created by 康梁 on 15/11/11.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLViewController.h"
#import "KLRect.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KLRect *rect = [[KLRect alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:rect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
        
        UINavigationItem *navItem = self.navigationItem;
        
        navItem.title = @"Rect";
    }
    return self;
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
