//
//  UILabel+AutoLayout.m
//  Apps
//
//  Created by BianYong on 16/10/13.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UILabel+AutoLayout.h"

@implementation UILabel (AutoLayout)

+ (UILabel *)autoLayoutLabel
{
	UILabel *label = [[UILabel alloc] init];
	label.translatesAutoresizingMaskIntoConstraints = NO;
	return label;
}

@end
