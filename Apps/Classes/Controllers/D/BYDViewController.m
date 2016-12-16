//
//  BYDViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYDViewController.h"
#import "BYDynamicTree.h"
#import "BYDynamicTreeModel.h"

@interface BYDViewController ()

@property (nonatomic, strong) NSMutableArray *treeDataList;
@property (nonatomic, strong) BYDynamicTree *treeView;

@end

@implementation BYDViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"DView";

	[self testData];
	[self initWithSetting];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)testData
{
	NSMutableArray *groupList = [NSMutableArray array]; //团体
	for (int i = 0; i < 1; i ++) { //团体
		BYDynamicTreeGroupModel *groupModel = [[BYDynamicTreeGroupModel alloc] init];
		groupModel.nodeType = BYDynamicTreeNodeTypeGroup;
		groupModel.title = [NSString stringWithFormat:@"Group:%d", i];
		
		NSMutableArray *teamList = [NSMutableArray array];  //组
		for (int j = 0; j < 2; j ++) { //组
			BYDynamicTreeTeamModel *teamModel = [[BYDynamicTreeTeamModel alloc] init];
			teamModel.nodeType = BYDynamicTreeNodeTypeTeam;
			teamModel.title = [NSString stringWithFormat:@"group:%d team:%d", i, j];
			
			NSMutableArray *memberList = [NSMutableArray array];//成员
			for (int k = 0; k < 2; k ++) { //成员
				BYDynamicTreeMemberModel *memberModel = [[BYDynamicTreeMemberModel alloc] init];
				memberModel.nodeType = BYDynamicTreeNodeTypeMember;
				memberModel.title = [NSString stringWithFormat:@"group:%d team:%d member:%d", i, j, k];
				[memberList addObject:memberModel];
			}
			teamModel.membersOfTeamArr = memberList;
			[teamList addObject:teamModel];
		}
		groupModel.teamsOfGroupArr = teamList;
		[groupList addObject:groupModel];
	}
	
	self.treeDataList = groupList;
}

- (void)initWithSetting
{
	[self.view setBackgroundColor:BG_Color_Sub];
	
	[self.view addSubview:self.treeView];
	
	[_treeView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self);
		make.left.equalTo(self);
		make.bottom.equalTo(self);
		make.right.equalTo(self);
	}];
}

#pragma mark- Setter and getter
- (BYDynamicTree *)treeView
{
	if (!_treeView) {
		_treeView = [[BYDynamicTree alloc] initWithFrame:CGRectZero treeData:_treeDataList];
	}
	return _treeView;
}

#pragma mark- Square area

@end
