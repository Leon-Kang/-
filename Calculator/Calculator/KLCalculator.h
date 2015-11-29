//
//  KLCalculator.h
//  Calculator
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLCalculator : NSObject

// 累加方法
- (void)setAccumulator:(double)value;
- (void)claer;
- (double)accumulator;

// 算术方法
- (void)add:(double)value;
- (void)subtract:(double)value;
- (void)multiply:(double)value;
- (void)divide:(double)value;


@end
