//
//  BYMainViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYMainViewController.h"

#import "BYUtils.h"
#import "BYAViewController.h"
#import "BYBViewController.h"
#import "BYCViewController.h"
#import "BYDViewController.h"
#import "BYEViewController.h"
#import "BYNavigationViewController.h"

@interface BYMainViewController ()

@end

@implementation BYMainViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self createControllers];
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
- (void)createControllers
{
	//controllers
	UIViewController *vc1 = [[BYAViewController alloc] init];
	UIViewController *vc2 = [[BYBViewController alloc] init];
	UIViewController *vc3 = [[BYCViewController alloc] init];
	UIViewController *vc4 = [[BYDViewController alloc] init];
	UIViewController *vc5 = [[BYEViewController alloc] init];
	
	//tabBarItemImage
	UIImage *normalImage1 = Image_With_Name(@"MISTabOfficeTable");
	UIImage *normalImage2 = Image_With_Name(@"MISTabOfficeTable");
	UIImage *normalImage3 = Image_With_Name(@"MISTabOfficeTable");
	UIImage *normalImage4 = Image_With_Name(@"MISTabOfficeTable");
	UIImage *normalImage5 = Image_With_Name(@"MISTabOfficeTable");
	
	UIImage *selectedImage1 = Image_With_Name(@"MISTabOfficeTableHL");
	UIImage *selectedImage2 = Image_With_Name(@"MISTabOfficeTableHL");
	UIImage *selectedImage3 = Image_With_Name(@"MISTabOfficeTableHL");
	UIImage *selectedImage4 = Image_With_Name(@"MISTabOfficeTableHL");
	UIImage *selectedImage5 = Image_With_Name(@"MISTabOfficeTableHL");
	
	//图片取消系统渲染效果
	normalImage1 = [BYUtils imageWithRenderingModeCustomStyle:normalImage1];
	normalImage2 = [BYUtils imageWithRenderingModeCustomStyle:normalImage2];
	normalImage3 = [BYUtils imageWithRenderingModeCustomStyle:normalImage3];
	normalImage4 = [BYUtils imageWithRenderingModeCustomStyle:normalImage4];
	normalImage5 = [BYUtils imageWithRenderingModeCustomStyle:normalImage5];
	
	selectedImage1 = [BYUtils imageWithRenderingModeCustomStyle:selectedImage1];
	selectedImage2 = [BYUtils imageWithRenderingModeCustomStyle:selectedImage2];
	selectedImage3 = [BYUtils imageWithRenderingModeCustomStyle:selectedImage3];
	selectedImage4 = [BYUtils imageWithRenderingModeCustomStyle:selectedImage4];
	selectedImage5 = [BYUtils imageWithRenderingModeCustomStyle:selectedImage5];
	
	//tabBarItemTitle
	vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"AView" image:normalImage1 selectedImage:selectedImage1];
	vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"BView" image:normalImage2 selectedImage:selectedImage2];
	vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"CView" image:normalImage3 selectedImage:selectedImage3];
	vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"DView" image:normalImage4 selectedImage:selectedImage4];
	vc5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"EView" image:normalImage5 selectedImage:selectedImage5];
	
	//navigationControllers
	UINavigationController *nav1 = [[BYNavigationViewController alloc] initWithRootViewController:vc1];
	UINavigationController *nav2 = [[BYNavigationViewController alloc] initWithRootViewController:vc2];
	UINavigationController *nav3 = [[BYNavigationViewController alloc] initWithRootViewController:vc3];
	UINavigationController *nav4 = [[BYNavigationViewController alloc] initWithRootViewController:vc4];
	UINavigationController *nav5 = [[BYNavigationViewController alloc] initWithRootViewController:vc5];
	
	self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
}

#pragma mark- Setter and getter
#pragma mark- Square area

@end
