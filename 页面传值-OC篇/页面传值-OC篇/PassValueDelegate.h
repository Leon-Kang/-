//
//  PassValueDelegate.h
//  页面传值-OC篇
//
//  Created by 康梁 on 16/1/7.
//  Copyright © 2016年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueDelegate <NSObject>

@optional

- (void)passValue:(NSString *)value;

@end
