//
//  KLItemStore.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLItemStore.h"
#import "BNRItem.h"
#import "KLImageStore.h"
#import "AppDelegate.h"
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
        // self.privateItem = [[NSMutableArray alloc] init];
        NSString *path = [self itemArchivePath];
        self.privateItem = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!self.privateItem) {
            self.privateItem = [[NSMutableArray alloc] init];
        }
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
    // BNRItem *item = [BNRItem randomItem];
    BNRItem *item = [[BNRItem alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    item.valueInDollars = [defaults integerForKey:KLItemValuePrefsKey];
    item.itemName = [defaults objectForKey:KLItemNamePrefsKey];
    
    NSLog(@"default = %@", [defaults dictionaryRepresentation]);
    
    [self.privateItem addObject:item];
    
    return item;
}
- (void)removeItem:(BNRItem *)item {
    NSString *key = item.itemKey;
    
    [[KLImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItem removeObjectIdenticalTo:item];
}

#pragma mark 获取文件路径
- (NSString *)itemArchivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    NSLog(@"%@", documentDirectory);
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}




- (BOOL)savaChanges {
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.privateItem
                                       toFile:path];
}

@end
