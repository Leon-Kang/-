//
//  BNRItem.h
//  KLCoreData
//
//  Created by 康梁 on 15/12/4.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (instancetype)randomItem;

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

//@property (nonatomic, copy) NSString *itemName;
//@property (nonatomic, copy) NSString *serialNumber;
//@property (nonatomic) int valueInDollars;
//@property (nonatomic, readonly, strong) NSDate *dateCreated;
//
//@property (nonatomic, copy) NSString *itemKey;

@end

NS_ASSUME_NONNULL_END

#import "BNRItem+CoreDataProperties.h"
