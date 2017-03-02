//
//  BYScrollPagerContentViewController.m
//  Apps
//
//  Created by BianYong on 17/3/2.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYScrollPagerContentViewController.h"
#import "BYScrollPagerView.h"

@interface BYScrollPagerContentViewController ()

@property (nonatomic, strong) BYScrollPagerView *scrollPagerView;

@end

@implementation BYScrollPagerContentViewController
#pragma mark- Live circle
- (instancetype)init
{
	if (self = [super init]) {
		[self initSetting];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self layoutScrollPagerContentView];
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
	self.title = @"ScrollPagerContentView";
	self.view.backgroundColor = BG_Color;
}

- (void)layoutScrollPagerContentView
{
	[self.view addSubview:self.scrollPagerView];
}

#pragma mark- Setter and getter
- (BYScrollPagerView *)scrollPagerView
{
	if (!_scrollPagerView) {
		_scrollPagerView = [[BYScrollPagerView alloc] initWithFrame:self.view.bounds];
		_scrollPagerView.backgroundColor = WHITE_COLOR;
	}
	return _scrollPagerView;
}

#pragma mark- Square area

@end
