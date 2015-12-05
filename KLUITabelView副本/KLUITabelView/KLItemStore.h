//
//  KLItemStore.h
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface KLItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItem;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;

- (BOOL)savaChanges;
@end
