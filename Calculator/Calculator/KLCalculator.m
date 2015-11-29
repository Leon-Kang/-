//
//  KLCalculator.m
//  Calculator
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLCalculator.h"

@implementation KLCalculator
{
    double accumulator;
}
// 累加方法
- (void)setAccumulator:(double)value {
    accumulator = value;
}

- (void)claer {
    accumulator = 0;
}

- (double)accumulator {
    return accumulator;
}

// 算术方法
- (void)add:(double)value {
    accumulator += value;
}

- (void)subtract:(double)value {
    accumulator -=value;
}

- (void)multiply:(double)value {
    accumulator *= value;
}

- (void)divide:(double)value {
    accumulator /= value;
}

@end
