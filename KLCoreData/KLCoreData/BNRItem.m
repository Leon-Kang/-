//
//  BNRItem.m
//  KLCoreData
//
//  Created by 康梁 on 15/12/4.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "BNRItem.h"

@interface BNRItem ()

// @property (nonatomic, strong) NSDate *dateCreated;

@end

@implementation BNRItem

- (void)awakeFromFetch {
    [super awakeFromFetch];
    
    self.dateCreated = [NSDate date];
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    self.itemKey = key;
}

@end
