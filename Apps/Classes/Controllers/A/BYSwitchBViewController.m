//
//  BYSwitchBViewController.m
//  Apps
//
//  Created by BianYong on 17/3/1.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYSwitchBViewController.h"

@interface BYSwitchBViewController ()

@end

@implementation BYSwitchBViewController
#pragma mark- Live circle
- (id)init
{
	if (self = [super init]) {
		[self initSetting];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"Switch_B";
	self.view.backgroundColor = [UIColor orangeColor];
}

#pragma mark- Setter and getter
#pragma mark- Square area

@end
