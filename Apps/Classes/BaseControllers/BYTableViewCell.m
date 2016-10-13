//
//  BYTableViewCell.m
//  Apps
//
//  Created by BianYong on 16/10/11.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYTableViewCell.h"

@implementation BYTableViewCell

+ (NSString *)reuseIdentifer
{
	return [NSString stringWithFormat:@"%@ReuseIdentifer", NSStringFromClass([self class])];
}

@end
