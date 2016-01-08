//
//  PaperInfo+CoreDataProperties.h
//  JsonCData
//
//  Created by 康梁 on 16/1/6.
//  Copyright © 2016年 kl. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PaperInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaperInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *paperID;
@property (nullable, nonatomic, retain) NSString *paperTypy;

@end

NS_ASSUME_NONNULL_END
