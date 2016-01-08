//
//  paperInfoModel.m
//  JsonCData
//
//  Created by 康梁 on 16/1/6.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "paperInfoModel.h"
#import "PaperInfo.h"
#import "AppDelegate.h"

@interface paperInfoModel ()



@end

static NSArray *dataArr;

@implementation paperInfoModel


+ (void)insertInfoPaprtInfo:(NSDictionary *)dataDic {
    
    AppDelegate *appDelegate = [UIApplication
                             sharedApplication].delegate;
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    PaperInfo *paperInfo = [NSEntityDescription insertNewObjectForEntityForName:@"PaperInfo" inManagedObjectContext:context];
    
    paperInfo.title = [dataDic valueForKey:@"title"];
    
    paperInfo.paperID = [dataDic valueForKey:@"paperID"];
    
    paperInfo.paperTypy = [dataDic valueForKey:@"paperTypy"];
    
    [appDelegate saveContext];
                                        
}

+ (void)insertAllPapers:(NSArray *)dataArr {
    
    for (NSDictionary *dic in dataArr) {
        [paperInfoModel insertInfoPaprtInfo:dic];
    }
    
}


+ (NSArray *)findAllPapers {
    AppDelegate *appDelegate = [UIApplication
                                sharedApplication].delegate;
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"PaperInfo"];
    
    [context executeFetchRequest:request error:nil];
    
    return dataArr;
}

@end
