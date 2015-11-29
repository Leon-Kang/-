//
//  CameraViewController.h
//  KLUITabelView
//
//  Created by 康梁 on 15/11/23.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"
#import "ValueDelegate.h"
#import "ViewController.h"

@interface CameraViewController : UIViewController <ValueDelegate>

@property (nonatomic, strong) BNRItem *items;


@end
