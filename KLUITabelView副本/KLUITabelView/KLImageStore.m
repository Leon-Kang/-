//
//  KLImageStore.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/25.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLImageStore.h"

@interface KLImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation KLImageStore

+ (instancetype)sharedStore {
    static KLImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@" Use +[KLImageStore sharedStore]" userInfo:nil];
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    // [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key {
    // return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
