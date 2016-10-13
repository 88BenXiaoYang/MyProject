//
//  UIButton+AutoLayout.m
//  Apps
//
//  Created by BianYong on 16/10/13.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UIButton+AutoLayout.h"

@implementation UIButton (AutoLayout)

+ (UIButton *)autoLayoutButton
{
	UIButton *button = [[UIButton alloc] init];
	button.translatesAutoresizingMaskIntoConstraints = NO;
	return button;
}

@end
