//
//  BYViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYViewController.h"

@interface BYViewController ()

@end

@implementation BYViewController
/*
 *初始化方法
 */
- (id)init
{
	self = [super init];
	if (self) {
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//布局
	if (IOS7)
	{
		self.edgesForExtendedLayout = UIRectEdgeNone;
		self.extendedLayoutIncludesOpaqueBars = NO;
	}
	
	//左右健
	self.navigationItem.leftBarButtonItem = [self leftBarButtonItem];
	self.navigationItem.rightBarButtonItem = [self rightBarButtonItem];
	
	//背景色
	self.view.backgroundColor = VIEW_BGCOLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 *返回方式
 */
- (void)goBack
{
	//两种情况返回。
	if ((self.navigationController.viewControllers)[0] == self)
	{
		[self dismissViewControllerAnimated:YES completion:nil];
	}
	else
	{
		[self.navigationController popViewControllerAnimated:YES];
	}
}

/*
 *左返回健
 */
- (UIBarButtonItem *)leftBarButtonItem
{
	//两种样式的返回。
	if ((self.navigationController.viewControllers)[0] == self)
	{
		return nil;
	}
	else
	{
		return nil;
	}
}

/*
 *右键侍定
 */
- (UIBarButtonItem *)rightBarButtonItem
{
	return nil;
}

/*
 *支持滑动返回。
 */
- (BOOL)canDragBack
{
	return YES;
}

@end
