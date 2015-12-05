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
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(clearCache:)
                   name:UIApplicationDidReceiveMemoryWarningNotification
                 object:nil];
        
    }
    return self;
}

- (void)clearCache:(NSNotification *)note {
    NSLog(@"flushing %lu image out of the cache",[self.dictionary count]);
    [self.dictionary removeAllObjects];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    // [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
    
    NSString *imagePath = [self imagePathForKey:key];
    
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    [data writeToFile:imagePath atomically:YES];
    
    
}

- (UIImage *)imageForKey:(NSString *)key {
    // return [self.dictionary objectForKey:key];
    
    UIImage *result = self.dictionary[key];
    
    
    if (!result) {
        NSString *imagePath = [self imagePathForKey:key];
        
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        if (result) {
            self.dictionary[key] = result;
        }
    } else {
        NSLog(@"Error: unable to find %@", [self imagePathForKey:key]);
    }
    
    return result;
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath
                                               error:nil];
}


- (NSString *)imagePathForKey:(NSString *)key {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:key];
}


@end
