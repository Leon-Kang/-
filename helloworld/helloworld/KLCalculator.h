//
//  KLCalculator.h
//  helloworld
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLCalculator : NSObject

@property (nonatomic) float num1;

@property (nonatomic) float num2;

// + (float)addition:(float)a and:(float)b;

- (void)addition:(float)a with:(float)b;
- (float)division:(float)a with:(float)b;
- (int)factorial:(int)a;
- (float)subtract:(float)a with:(float)b;
- (float)multiplication:(float)a with:(float)b;

@end
