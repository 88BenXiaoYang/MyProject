//
//  WXOrder.h
//  Apps
//
//  Created by by on 2017/6/4.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXOrder : NSObject

@property (nonatomic,   copy) NSString *orderID;
@property (nonatomic,   copy) NSString *prepayID;

+ (WXOrder *)appComboOrderModelWithDictionary:(NSDictionary *)dict;

@end
