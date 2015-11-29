//
//  KLClassB.h
//  ARC
//
//  Created by 康梁 on 15/11/9.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLClassA.h"

@class KLClassA;

@interface KLClassB : NSObject

@property (nonatomic, strong) KLClassA *classA;

@end
