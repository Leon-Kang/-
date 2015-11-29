//
//  KLItemStore.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLItemStore.h"
#import "BNRItem.h"

@interface KLItemStore ()

@property (nonatomic) NSMutableArray *privateItem;

@end

@implementation KLItemStore

+ (instancetype)sharedStore {
    static KLItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[KLItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    
    self = [super init];
    if (self) {
        self.privateItem = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItem {
    return self.privateItem;
}

- (NSArray *)allItems {
    return [self.privateItem copy];
}

- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItem addObject:item];
    
    return item;
}



@end
