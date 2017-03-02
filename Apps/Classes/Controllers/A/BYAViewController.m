//
//  BYAViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYAViewController.h"
#import "BYDemoListCell.h"
#import "BYLayoutViewController.h"
#import "BYAppSkipViewController.h"
#import "BYCheckBoxViewController.h"
#import "BYDrawImageViewController.h"
#import "BYSwitchAViewController.h"
#import "BYScrollPagerContentViewController.h"

@interface BYAViewController ()

@property (nonatomic, strong) NSMutableArray *demoList;

@end

@implementation BYAViewController
#pragma mark- Live circle
- (id)init {
	if (self = [super init]) {
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"DemoList"; //set tabBarItem.title and con.title
	
	[self initSettingData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _demoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BYDemoListCell reuseIdentifier]];
	
	NSString *demoName = [_demoList objectAtIndex:indexPath.row];
	
	cell.textLabel.text = demoName;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0) {
		[self goLayoutElementVC];
	} else if (indexPath.row == 1) {
		[self goSkipToAppStore];
	} else if (indexPath.row == 2) {
		[self goCheckBox];
	} else if (indexPath.row == 3) {
		[self goDrawImgVC];
	} else if (indexPath.row == 4) {
		[self goSwitchAVC];
	} else if (indexPath.row == 5) {
		[self goScrollPagerView];
	}
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSettingData
{
	self.demoList = [NSMutableArray arrayWithObjects:@"按钮元素布局", @"应用跳转到AppStore", @"CheckBox", @"BezierPathImg", @"SwitchUI", @"ScrollPagerView", nil];
	
	[self.table registerClass:[BYDemoListCell class] forCellReuseIdentifier:[BYDemoListCell reuseIdentifier]];
}

- (void)goLayoutElementVC
{
	BYLayoutViewController *layoutVC = [[BYLayoutViewController alloc] init];
	layoutVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:layoutVC animated:YES];
}

- (void)goSkipToAppStore
{
	BYAppSkipViewController *appSkipVC = [[BYAppSkipViewController alloc] init];
	appSkipVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:appSkipVC animated:YES];
}

- (void)goCheckBox
{
	BYCheckBoxViewController *checkBoxVC = [[BYCheckBoxViewController alloc] init];
	checkBoxVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:checkBoxVC animated:YES];
}

- (void)goDrawImgVC
{
	BYDrawImageViewController *drawImgVC = [[BYDrawImageViewController alloc] init];
	drawImgVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:drawImgVC animated:YES];
}

- (void)goSwitchAVC
{
	BYSwitchAViewController *switchAVC = [[BYSwitchAViewController alloc] init];
	switchAVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:switchAVC animated:YES];
}

- (void)goScrollPagerView
{
	BYScrollPagerContentViewController *scrollPagerVC = [[BYScrollPagerContentViewController alloc] init];
	scrollPagerVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:scrollPagerVC animated:YES];
}

#pragma mark- Setter and getter
- (NSMutableArray *)demoList
{
	if (!_demoList) {
		_demoList = [NSMutableArray array];
	}
	return _demoList;
}

#pragma mark- Square area

@end
