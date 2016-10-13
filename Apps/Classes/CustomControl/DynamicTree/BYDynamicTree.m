//
//  BYDynamicTree.m
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYDynamicTree.h"
#import "BYDynamicTreeData.h"
#import "BYDynamicTreeModel.h"
#import "BYDynamicTreeCell.h"

@interface BYDynamicTree () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *treeTableView;

@end

@implementation BYDynamicTree

#pragma mark- Live circle
- (instancetype)initWithFrame:(CGRect)frame treeData:(NSMutableArray *)treeArray
{
	if (self = [super initWithFrame:frame]) {
		[self initWithSetting];
		[self initWithData:treeArray];
		[self handleData];
	}
	return self;
}

#pragma mark- Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [BYDynamicTreeData instance].groupDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	BYDynamicTreeGroupDataModel *groupDataModel = [BYDynamicTreeData instance].groupDataArray[section];
	return groupDataModel.itemsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	BYDynamicTreeGroupDataModel *groupDataModel = [BYDynamicTreeData instance].groupDataArray[indexPath.section];
	BYDynamicTreeModel *nodeModel = groupDataModel.itemsArr[indexPath.row];
	
	BYDynamicTreeCell *cell;
	cell = [tableView dequeueReusableCellWithIdentifier:[BYDynamicTreeCell reuseIdentifer]];
	
	if (!cell) {
		cell = [[BYDynamicTreeCell alloc] initWithCellType:nodeModel.nodeType];
	}
		
	[cell setCellInfoWithModel:nodeModel clickBlock:^{
		[self arrowBtnClickWithNode:nodeModel indexPath:indexPath assistData:groupDataModel];
	}];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	BYDynamicTreeGroupDataModel *groupDataModel = [BYDynamicTreeData instance].groupDataArray[indexPath.section];
	BYDynamicTreeModel *node = groupDataModel.itemsArr[indexPath.row];
	
	if (node.nodeType == BYDynamicTreeNodeTypeMember) {
		node.isSelect = !node.isSelect;
	} else {
		BYDynamicTreeTeamModel *teamNode = (BYDynamicTreeTeamModel *)node;
		teamNode.isSelect = !teamNode.isSelect;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	BYDynamicTreeGroupDataModel *groupDataModel = [BYDynamicTreeData instance].groupDataArray[section];
	
	UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
	headerV.backgroundColor = VIEW_BGCOLOR;
	
	UILabel *titleLab = [UILabel autoLayoutLabel];
	titleLab.backgroundColor = Clear_Color;
	titleLab.textColor = [UIColor blackColor];
	titleLab.text = groupDataModel.title;
	[headerV addSubview:titleLab];
	
	[titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(headerV).offset(10);
		make.top.equalTo(headerV);
		make.width.mas_equalTo(150);
		make.bottom.equalTo(headerV);
	}];
	
	return headerV;
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initWithSetting
{
	[self addViews];
	[self layoutViews];
}

- (void)addViews
{
	[self addSubview:self.treeTableView];
}

- (void)layoutViews
{
	[_treeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self);
		make.left.equalTo(self);
		make.bottom.equalTo(self);
		make.right.equalTo(self);
	}];
}

- (void)initWithData:(NSMutableArray *)dataArray
{
	//数据初始化
	[BYDynamicTreeData instance].contentArray = dataArray;
}

//处理数据构造树节点
- (void)handleData
{
	NSMutableArray *groupDataArr = [NSMutableArray array];
	
	for (BYDynamicTreeGroupModel *groupModel in [BYDynamicTreeData instance].contentArray) {
		
		BYDynamicTreeGroupDataModel *groupDataModel = [[BYDynamicTreeGroupDataModel alloc] init];
		groupDataModel.title = groupModel.title;
		
		//组
		for (NSInteger j = 0; j < groupModel.teamsOfGroupArr.count; j ++) {
			BYDynamicTreeTeamModel *tmModel = groupModel.teamsOfGroupArr[j];
			
			[groupDataModel.nodesArr addObject:tmModel];
			
			tmModel.nodeRange = NSMakeRange(j, 1);
			tmModel.subNodeRange = NSMakeRange(groupDataModel.nodesArr.count - 1, tmModel.membersOfTeamArr.count + 1);
			tmModel.nodeIndex = j;
			
			//成员
			for (BYDynamicTreeMemberModel *mmModel in tmModel.membersOfTeamArr) {
				[groupDataModel.nodesArr addObject:mmModel];
			}
			
			[groupDataModel.treeNodesArr addObject:tmModel];
		}
		
		groupDataModel.itemsArr = [groupDataModel.treeNodesArr mutableCopy];
		
		[groupDataArr addObject:groupDataModel];
		
		/*
		//构造node、tree数组
		for (NSInteger i = 0; i < dataModel.groupsArr.count; i ++) {
			//团体
			BYDynamicTreeGroupModel *gpModel = dataModel.groupsArr[i];
//			[dataModel.nodesArr addObject:gpModel];
			
			//组
			for (NSInteger j = 0; j < gpModel.teamsOfGroupArr.count; j ++) {
				BYDynamicTreeTeamModel *tmModel = gpModel.teamsOfGroupArr[j];
				
				[dataModel.nodesArr addObject:tmModel];
				
				tmModel.nodeRange = NSMakeRange(j, 1);
				tmModel.subNodeRange = NSMakeRange(dataModel.nodesArr.count - 1, tmModel.membersOfTeamArr.count + 1);
				tmModel.nodeIndex = j;
				
				//成员
				for (BYDynamicTreeMemberModel *mmModel in tmModel.membersOfTeamArr) {
					[dataModel.nodesArr addObject:mmModel];
				}
				
				[dataModel.treeNodesArr addObject:tmModel];
			}
			
			dataModel.itemsArr = [dataModel.treeNodesArr mutableCopy];
		}
		 */
	}
	
	[BYDynamicTreeData instance].groupDataArray = groupDataArr;
}

#pragma mark- Core Methods
#pragma mark- 展开、折叠TableView
/***
 * 所触摸的node
 * node所在是indexPath
 * 展开、折叠所需要的数据
 ***/
- (void)arrowBtnClickWithNode:(BYDynamicTreeModel *)node indexPath:(NSIndexPath *)indexPath assistData:(BYDynamicTreeGroupDataModel *)assistData
{
	if (node.isOpen) {
		[self minusSubnodesFromFatherNode:node assistData:assistData indexPath:indexPath];
	} else {
		NSInteger index = indexPath.row + 1;
		[self addSubnodesToFatherNode:node atIndex:index assistData:assistData indexPath:indexPath];
	}
}

#pragma mark- 增加子节点，为指定的节点增加子节点
/***
 * index 为当前节点所对应的下一个节点位置
 ***/
#warning 可以优化，不要index参数
- (void)addSubnodesToFatherNode:(BYDynamicTreeModel *)fatherNode atIndex:(NSInteger)index assistData:(BYDynamicTreeGroupDataModel *)assistData indexPath:(NSIndexPath *)indexPath
{
	NSMutableArray *dataArr = [NSMutableArray array];         //数据数组
	NSMutableArray *cellIndexPathes = [NSMutableArray array]; //位置数组
	
	NSInteger rowIndex = index; //row的下标
	
	//遍历当前所触摸节点的子节点的范围，并将数据、位置加到对应数组
	NSInteger startLoc = fatherNode.subNodeRange.location + 1; //从当前节点的下一个节点开始
	NSInteger nodeRange = fatherNode.subNodeRange.location + fatherNode.subNodeRange.length; //范围是当前节点加上其对应子节点的个数
	for (NSInteger i = startLoc; i < nodeRange; i ++) {
		[dataArr addObject:assistData.nodesArr[i]];
		[cellIndexPathes addObject:[NSIndexPath indexPathForRow:rowIndex++ inSection:indexPath.section]];
	}
	
	//数结构信息控制!!!
	//更改父节点的状态范围
	NSRange range = NSMakeRange(fatherNode.nodeRange.location, fatherNode.subNodeRange.length);
	fatherNode.nodeRange = range;
	[self searchNodeTreeFromSpecificNode:fatherNode assistData:assistData];
	
	//修改当前节点的父节点的range
	if (fatherNode.fatherNode) {
		fatherNode.fatherNode.nodeRange = NSMakeRange(fatherNode.fatherNode.nodeRange.location, fatherNode.fatherNode.nodeRange.length + fatherNode.nodeRange.length);
	}
	
	//刷新界面
	if (cellIndexPathes.count) {
		fatherNode.isOpen = YES;
		NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, dataArr.count)];
		[assistData.itemsArr insertObjects:dataArr atIndexes:indexSet];
		[_treeTableView insertRowsAtIndexPaths:cellIndexPathes withRowAnimation:UITableViewRowAnimationFade];
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[_treeTableView reloadData];
		});
	}
}

//检索节点树数组treeArr，并修改指定节点之后的节点的location
- (void)searchNodeTreeFromSpecificNode:(BYDynamicTreeModel *)specificNode assistData:(BYDynamicTreeGroupDataModel *)assistData
{
	BYDynamicTreeTeamModel *currentNode = (BYDynamicTreeTeamModel *)specificNode;
	
	for (NSInteger i = specificNode.nodeIndex + 1; i < assistData.treeNodesArr.count; i ++) {
		BYDynamicTreeTeamModel *team = assistData.treeNodesArr[i];
		
		//如果当前节点是root节点 偏移量为1
		NSRange range;
		if (currentNode.nodeType == BYDynamicTreeNodeTypeAllGroup) {
			range = NSMakeRange(currentNode.nodeRange.location + 1, team.nodeRange.length);
		} else {
			range = NSMakeRange(currentNode.nodeRange.location + currentNode.nodeRange.length, team.nodeRange.length);
		}
		team.nodeRange = range;
		currentNode = team;
	}
}

#pragma mark- 删除子节点，从指定的父节点处删除子节点
- (void)minusSubnodesFromFatherNode:(BYDynamicTreeModel *)fatherNode assistData:(BYDynamicTreeGroupDataModel *)assistData indexPath:(NSIndexPath *)indexPath
{
	NSMutableArray *cellIndexPaths = [NSMutableArray array]; //位置数组
	
	//根据当前节点的range信息删除对应的子节点
	for (NSInteger i = fatherNode.nodeRange.location + fatherNode.nodeRange.length - 1; i > fatherNode.nodeRange.location; i --) {
		[assistData.itemsArr removeObjectAtIndex:i];
		[cellIndexPaths addObject:[NSIndexPath indexPathForRow:(fatherNode.nodeRange.location + fatherNode.nodeRange.location + fatherNode.nodeRange.length - i) inSection:indexPath.section]];
	}
	
	//修改当前节点的父节点的range信息（length）
	if (fatherNode.fatherNode) {
		fatherNode.fatherNode.nodeRange = NSMakeRange(fatherNode.fatherNode.nodeRange.location, fatherNode.fatherNode.nodeRange.length - fatherNode.nodeRange.length);
	}
	
	//修改当前节点后面节点的range的location
	NSRange range = NSMakeRange(fatherNode.nodeRange.location, 1);
	fatherNode.nodeRange = range;
	fatherNode.isOpen = NO;
	[self searchNodeTreeFromSpecificNode:fatherNode assistData:assistData];
	
	[_treeTableView deleteRowsAtIndexPaths:cellIndexPaths withRowAnimation:UITableViewRowAnimationFade];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[_treeTableView reloadData];
	});
}

#pragma mark- Setter and getter
-(UITableView *)treeTableView
{
	if (!_treeTableView) {
		_treeTableView = [UITableView autoLayoutPlainTableView];
		_treeTableView.delegate = self;
		_treeTableView.dataSource = self;
		_treeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_treeTableView.backgroundColor = [UIColor orangeColor];
	}
	return _treeTableView;
}

#pragma mark- Square area

@end
