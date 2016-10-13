//
//  BYDynamicTreeModel.h
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BYDynamicTreeNodeType) {
	BYDynamicTreeNodeTypeAllGroup = 111, //Root
	BYDynamicTreeNodeTypeAllTeam,
	BYDynamicTreeNodeTypeGroup,
	BYDynamicTreeNodeTypeTeam,
	BYDynamicTreeNodeTypeMember
};

//公共数据-----------------------------------------------------------
@interface BYDynamicTreeModel : NSObject

@property (nonatomic,   copy) NSString *title;
@property (nonatomic, assign) BOOL isSelect; //是否选中
@property (nonatomic, assign) BOOL isOpen;   //是否展开

//树形结构中节点属性
@property (nonatomic,   weak) BYDynamicTreeModel *fatherNode; //父节点
@property (nonatomic, assign) BYDynamicTreeNodeType nodeType; //节点类型
@property (nonatomic, assign) NSRange nodeRange;              //节点自身的range属性
@property (nonatomic, assign) NSRange subNodeRange;           //当前节点下子节点的range属性
@property (nonatomic, assign) NSInteger nodeIndex;            //节点索引

@end

//成员----------------------------------------------------------------
@interface BYDynamicTreeMemberModel : BYDynamicTreeModel

@end

//组-----------------------------------------------------------------
@interface BYDynamicTreeTeamModel : BYDynamicTreeMemberModel

@property (nonatomic, strong) NSMutableArray *membersOfTeamArr;

@end

//团体---------------------------------------------------------------
@interface BYDynamicTreeGroupModel : BYDynamicTreeTeamModel

@property (nonatomic, strong) NSMutableArray *teamsOfGroupArr;

@end

//数据源-------------------------------------------------------------
@interface BYDynamicTreeGroupDataModel : BYDynamicTreeGroupModel

@property (nonatomic, strong) NSMutableArray *itemsArr;       //用于rows
@property (nonatomic, strong) NSMutableArray *nodesArr;       //用于存储父节点下的子节点数据（数节点）
@property (nonatomic, strong) NSMutableArray *treeNodesArr;   //树节点数组，用于存储节点的location信息（存放当前界面展示的节点数据）

@end
