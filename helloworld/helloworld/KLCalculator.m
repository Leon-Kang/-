//
//  KLCalculator.m
//  helloworld
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLCalculator.h"

@implementation KLCalculator

//+ (float)addition:(float)a and:(float)b {
//    return (a + b);
//}

// 实现一个加法方法
- (void)addition:(float)a with:(float)b {
    float c = a + b;
    NSLog(@"%f",c);
}

// 减法
- (float)subtract:(float)a with:(float)b {
    return a - b;
}

// 乘法
- (float)multiplication:(float)a with:(float)b {
    return a * b;
}

// 实现一个除法方法
- (float)division:(float)a with:(float)b {
    if (b == 0) {
        NSLog(@"WRONG!");
        return 0;
    }else {
        return (a / b);
    }
}

// 实现n的阶乘
- (int)factorial:(int)a {
    int sum = 1;
    if (a == 0) {
        return sum;
    }else if (a < 0) {
        NSLog(@"WRONG");
        return 0;
    }else {
        for (int i = 1; i <= a; i++) {
            sum *= i;
        }
        return sum;
    }
    
}

@end
