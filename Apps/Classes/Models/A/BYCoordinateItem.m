//
//  BYCoordinateItem.m
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYCoordinateItem.h"

@implementation BYCoordinateItem

/**
 *
 *  构造函数
 *
 *  @param xValue X坐标值
 *  @param yValue Y坐标值
 *
 *  @return
 */
- (id)initWithXValue:(NSString *)xValue withYValue:(NSString *)yValue
{
	self = [super init];
	if (self)
	{
		self.coordinateXValue = xValue;
		self.coordinateYValue = yValue;
	}
	return self;
}

/**
 *
 *  构造函数
 *
 *  @param xValue    X坐标值
 *  @param yValue    Y坐标值
 *  @param itemColor item的颜色
 *
 *  @return
 */
- (id)initWithXValue:(NSString *)xValue
		  withYValue:(NSString *)yValue
		   withColor:(UIColor *)itemColor
{
	self = [super init];
	if (self)
	{
		self.coordinateXValue = xValue;
		self.coordinateYValue = yValue;
		self.itemColor = itemColor;
	}
	return self;
}

@end
