//
//  KLHelloWorld.h
//  helloworld
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLHelloWorld : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) float value;


+ (void)sayHello;

- (void)print:(NSString *)str;

- (void)printName;


@end
