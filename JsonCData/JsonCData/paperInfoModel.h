//
//  paperInfoModel.h
//  JsonCData
//
//  Created by 康梁 on 16/1/6.
//  Copyright © 2016年 kl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface paperInfoModel : NSObject

+ (void)insertInfoPaprtInfo:(NSDictionary *)dataDic;

+ (void)insertAllPapers:(NSArray *)dataArr;

+ (NSArray *)findAllPapers;

@end
