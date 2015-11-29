//
//  JobDelegate.h
//  协议2
//
//  Created by 康梁 on 15/11/18.
//  Copyright © 2015年 kl. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol JobDelegate <NSObject>

- (void)passValue:(NSString *)value;

@optional

- (void)getValue:(NSString *)value;


@end