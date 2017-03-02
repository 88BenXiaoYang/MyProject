//
//  BYScrollPagerView.m
//  Apps
//
//  Created by BianYong on 17/3/2.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYScrollPagerView.h"

@interface BYScrollPagerView ()

@property (nonatomic, strong) UIView *titleContainerView;
@property (nonatomic, strong) UIView *contentContainerView;

@end

@implementation BYScrollPagerView
#pragma mark- Live circle
- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self prepare];
	}
	return self;
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
	
}

#pragma mark- Setter and getter
- (UIView *)titleContainerView
{
	if (!_titleContainerView) {
		_titleContainerView = [UIView autoLayoutView];
	}
	return _titleContainerView;
}

#pragma mark- Square area

@end
