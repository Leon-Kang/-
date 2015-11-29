//
//  KLManagerViewController.h
//  协议2
//
//  Created by 康梁 on 15/11/18.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "JobDelegate.h"



@interface KLManagerViewController : UIViewController

@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) id<JobDelegate> delegate;

@end
