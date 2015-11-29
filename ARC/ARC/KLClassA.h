//
//  KLClassA.h
//  ARC
//
//  Created by 康梁 on 15/11/9.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLClassB.h"

@class KLClassB;

@interface KLClassA : NSObject

@property (nonatomic, weak) KLClassB *classB;

@end
