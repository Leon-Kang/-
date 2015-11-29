//
//  KLClassB.h
//  helloworld
//
//  Created by 康梁 on 15/11/4.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLClassA.h"

@class KLAnyone;

@interface KLClassB : KLClassA


@property (nonatomic, strong) NSString *str;

@property (nonatomic) float heihgt;
@property (nonatomic) float weight;

- (float)area:(float)h with:(float)w;

- (void)printVar;
- (void)initAndPrint;

@end
