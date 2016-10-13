//
//  BYDynamicTreeData.h
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYDynamicTreeData : NSObject

@property (nonatomic, strong) NSMutableArray *contentArray;    //内容数据
@property (nonatomic, strong) NSMutableArray *groupDataArray;  //团体成员数组

+ (instancetype)instance;

@end
