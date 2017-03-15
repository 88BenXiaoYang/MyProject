//
//  BYLineChartView.h
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYBaseCoordinateView.h"

@interface BYLineChartView : BYBaseCoordinateView

/**
 *
 *  构建方法
 *
 *  @param dataSource  数据源
 *  @param color       折线点和折线的颜色
 *  @param isAnimation 是否动态绘制
 *
 *  @return
 */
- (id)initWithDataSource:(NSDictionary *)dataSourceDic
   withLineAndPointColor:(UIColor *)color
		   withAnimation:(BOOL)isAnimation;

@end
