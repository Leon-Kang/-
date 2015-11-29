//
//  KLClassB.m
//  helloworld
//
//  Created by 康梁 on 15/11/4.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLClassB.h"

@implementation KLClassB

- (void)printVar {
    NSLog(@"%i",self.a);
}

- (void)initAndPrint {
    self.a = 200;
    self.str = @"HELLO KL!";
    NSLog(@"%i,%@", self.a, self.str);
}

- (float)area:(float)h with:(float)w {
    return h * w;
}

@end
