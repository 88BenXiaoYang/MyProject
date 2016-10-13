//
//  BYDynamicTreeData.m
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYDynamicTreeData.h"

@interface BYDynamicTreeData ()

@end

@implementation BYDynamicTreeData

+ (instancetype)instance
{
	static BYDynamicTreeData *sharedBYDynamicTreeData = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedBYDynamicTreeData = [[BYDynamicTreeData alloc] init];
	});
	return sharedBYDynamicTreeData;
}

@end
