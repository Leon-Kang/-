//
//  ValueDelegate.h
//  KLUITabelView
//
//  Created by 康梁 on 15/11/23.
//  Copyright © 2015年 kl. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BNRItem.h"
@protocol ValueDelegate <NSObject>

- (void)passValue:(BNRItem *)item;

@end


