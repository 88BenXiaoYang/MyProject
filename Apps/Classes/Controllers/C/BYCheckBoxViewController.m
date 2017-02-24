//
//  BYCheckBoxViewController.m
//  Apps
//
//  Created by BianYong on 17/2/24.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYCheckBoxViewController.h"

@interface BYCheckBoxViewController ()

@end

@implementation BYCheckBoxViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initSetting];
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
	self.view.backgroundColor = [UIColor orangeColor];
	
	[self layoutCheckBox];
}

- (void)layoutCheckBox
{
	NSInteger count = 9;
	
	CGFloat marginH = 15.0f;
	CGFloat marginV = 15.0f;
	CGFloat pointY = 5.0f;
	CGFloat pointX = marginH;
	
	pointY += marginV;
	pointY += 55;
	
	if (count == 0) {
		return;
	}
	
	// btn layout
	CGFloat btnW = (SCREEN_WIDTH - marginH * 3) / 2.0f;
	CGFloat btnH = 30.0f;
	
	for (NSInteger i = 0; i < count; i++) {
		UIButton *btn = [self createCustomButton];
		btn.frame = CGRectMake(pointX, pointY, btnW, btnH);
		[self.view addSubview:btn];
		
		pointX += btnW;
		pointX += marginH;
		
		if ((i + 1) % 2 == 0) {
			pointX = marginH;
			pointY += marginV;
			pointY += btnH;
		}
		
		if ((i == count - 1) && (count % 2 != 0)) {
			pointY += marginV;
			pointY += btnH;
		}
	}
}

- (UIButton *)createCustomButton
{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.layer.cornerRadius = 8;
	btn.layer.masksToBounds = YES;
	[btn setBackgroundColor:[UIColor lightGrayColor]];
	
	return btn;
}

#pragma mark- Setter and getter
#pragma mark- Square area


@end
