//
//  BYBaseCoordinateView.h
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MARGIN_BETWEEN_X_POINT 30   //X轴的坐标点的间距
#define MARGIN_BETWEEN_Y_POINT 20   //Y轴的坐标点的间距
#define Y_SECTION 9                 //纵坐标轴的区间数
#define X_SECTION 6                 //横坐标轴的区间数

@interface BYBaseCoordinateView : UIView

@property (nonatomic, assign) CGFloat marginLeft;
@property (nonatomic, assign) CGFloat marginTop;
@property (nonatomic, assign) CGFloat marginBetweenX;

- (id)initWithDataSource:(NSDictionary *)dataSourceDic;

@end
