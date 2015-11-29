//
//  KLHelloWorld.m
//  helloworld
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLHelloWorld.h"

@implementation KLHelloWorld

+ (void)sayHello {
    NSLog(@"Hello World!");
}

- (void)print:(NSString *)str {
    NSLog(@"%@, %@",self.name,str);
}

- (void)printName {
    NSLog(@"The Name is %@.",self.name);
}


@end
