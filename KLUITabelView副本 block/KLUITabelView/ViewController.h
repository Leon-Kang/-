//
//  ViewController.h
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"
#import "ValueDelegate.h"

@interface ViewController : UIViewController

@property (nonatomic, assign) id<ValueDelegate> delegate;

@end

