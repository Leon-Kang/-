//
//  KLClassA.m
//  指针实验
//
//  Created by 康梁 on 15/11/4.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLClassA.h"

@interface KLClassA ()

@property (nonatomic, strong) NSString *name;

- (void)localPrint;

@end



@implementation KLClassA

- (void)localPrint {
    NSLog(@"%@",self.name);
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"KLClassA init nethod has been excuted");
    }
    return self;
}


- (void)print {
    NSLog(@"KLClassA");
    [self localPrint];
}



@end
