//
//  KLAViewController.h
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^returnTextBlock)(NSString *text);

@interface KLAViewController : UIViewController

@property (nonatomic, copy) returnTextBlock returnTextBlock;

- (void)returnText:(returnTextBlock)textBlock;

@end
