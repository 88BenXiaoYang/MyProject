//
//  WXOrder.m
//  Apps
//
//  Created by by on 2017/6/4.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "WXOrder.h"

@implementation WXOrder

+ (WXOrder *)appComboOrderModelWithDictionary:(NSDictionary *)dict
{
    return [[WXOrder alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.orderID = [dict stringValueForKey:@"orderID"];
        self.prepayID = [dict stringValueForKey:@"prepayID"];
    }
    return self;
}

@end
