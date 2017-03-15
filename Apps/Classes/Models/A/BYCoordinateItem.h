//
//  BYCoordinateItem.h
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYCoordinateItem : NSObject

@property (nonatomic,   copy) NSString *coordinateXValue; //x
@property (nonatomic,   copy) NSString *coordinateYValue; //y
@property (nonatomic, strong) UIColor *itemColor;

/**
 *
 *  构造函数
 *
 *  @param xValue X坐标值
 *  @param yValue Y坐标值
 *
 *  @return
 */
- (id)initWithXValue:(NSString *)xValue withYValue:(NSString *)yValue;

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
		   withColor:(UIColor *)itemColor;

@end
