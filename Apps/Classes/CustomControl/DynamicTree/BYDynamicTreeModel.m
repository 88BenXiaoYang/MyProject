//
//  BYDynamicTreeModel.m
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYDynamicTreeModel.h"

//公共数据-----------------------------------------------------------
@implementation BYDynamicTreeModel

@end

//成员----------------------------------------------------------------
@implementation BYDynamicTreeMemberModel

@end

//组-----------------------------------------------------------------
@implementation BYDynamicTreeTeamModel

@end

//团体---------------------------------------------------------------
@implementation BYDynamicTreeGroupModel

@end

//数据源-------------------------------------------------------------
@implementation BYDynamicTreeGroupDataModel

- (instancetype)init
{
	if (self = [super init]) {
		self.itemsArr = [NSMutableArray array];
		self.nodesArr = [NSMutableArray array];
		self.treeNodesArr = [NSMutableArray array];
	}
	return self;
}

@end
