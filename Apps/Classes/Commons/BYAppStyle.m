//
//  BYAppStyle.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYAppStyle.h"

@implementation BYAppStyle

+ (void)setupStyle
{
	//setup tabBarItem style
	[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
	[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
}

@end
