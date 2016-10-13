//
//  UIImageView+AutoLayout.m
//  Apps
//
//  Created by BianYong on 16/10/13.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UIImageView+AutoLayout.h"

@implementation UIImageView (AutoLayout)

+ (UIImageView *)autoLayoutImageView
{
	UIImageView *imageView = [[UIImageView alloc] init];
	imageView.translatesAutoresizingMaskIntoConstraints = NO;
	return imageView;
}

@end
