//
//  BYBaseCoordinateView.m
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYBaseCoordinateView.h"
#import "BYCoordinateItem.h"

#define MARGIN_LEFT 35              //统计图的左间隔
#define MARGIN_TOP 30               //统计图的顶部间隔

@interface BYBaseCoordinateView ()

@property (nonatomic, assign) CGFloat dashedSpace; //虚线距离

@property (nonatomic, assign) int maxYValue; //y_maxValue
@property (nonatomic, assign) int yNumberSpace;

@property (nonatomic, strong) UIImageView *xArrowImageView;
@property (nonatomic, strong) UIImageView *yArrowImageView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *xScaleArray; //x轴刻度
@property (nonatomic, strong) NSMutableArray *yScaleArray; //y轴刻度


@end

@implementation BYBaseCoordinateView
#pragma mark- Live circle
- (id)initWithDataSource:(NSDictionary *)dataSourceDic
{
	if (self = [super init]) {
		self.xScaleArray = dataSourceDic[@"xScaleArray"];
		self.yScaleArray = dataSourceDic[@"yScaleArray"];
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	//绘制坐标系
	[self drawCoordinate];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)drawCoordinate
{
	CGContextRef currentCtx = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(currentCtx, [[UIColor grayColor] CGColor]);
	CGContextSetLineWidth(currentCtx, 1);
	
	//point
	CGFloat length_x = X_SECTION * MARGIN_BETWEEN_X_POINT;
	CGFloat length_y = Y_SECTION * MARGIN_BETWEEN_Y_POINT;
	
//	CGFloat left_top_x = 0;
//	CGFloat left_top_y = 0;
	CGFloat left_bottom_x = (self.bounds.size.width - length_x)/2;
	CGFloat left_bottom_y = (self.bounds.size.height - ((self.bounds.size.height - length_y)/2));
	CGFloat right_top_x = self.bounds.size.width - left_bottom_x;;
	CGFloat right_top_y = (self.bounds.size.height - length_y)/2;
	CGFloat right_bottom_x = right_top_x;
	CGFloat right_bottom_y = left_bottom_y;
	
	//绘制两条线
	CGPoint poins[] = {CGPointMake(right_top_x, right_top_y)/*right_top*/,
		CGPointMake(right_bottom_x, right_bottom_y)/*right_bottom*/,
		CGPointMake(left_bottom_x, left_bottom_y)/*left_bottm*/};
	CGContextAddLines(currentCtx,poins,3);
//	CGContextClosePath(currentCtx);
	CGContextStrokePath(currentCtx);
	
	/*
	//1.绘制X轴和y轴
	//第一种方法绘制四条线
	CGPoint poins[] = {CGPointMake(MARGIN_LEFT, MARGIN_TOP),
		CGPointMake(self.frame.size.width - MARGIN_LEFT, MARGIN_TOP),
		CGPointMake(self.frame.size.width - MARGIN_LEFT, self.frame.size.height - MARGIN_TOP),
		CGPointMake(MARGIN_LEFT, self.frame.size.height - MARGIN_TOP)};
	CGContextAddLines(currentCtx,poins,4);
	CGContextClosePath(currentCtx);
	CGContextStrokePath(currentCtx);
	 */
	
	/*
	 //第二种方法绘制一个矩形
	 CGContextMoveToPoint(currentCtx, MARGIN_LEFT, MARGIN_TOP);
	 CGContextSetLineWidth(currentCtx, 0.1);
	 CGContextSetRGBStrokeColor(currentCtx, 0.5, 0.5, 0.5, 1);
	 CGContextAddRect(currentCtx, CGRectMake(MARGIN_LEFT, MARGIN_TOP, self.frame.size.width - 2*MARGIN_LEFT, self.frame.size.height - 2*MARGIN_TOP));
	 CGContextClosePath(currentCtx);
	 CGContextStrokePath(currentCtx);
	 */
	
	//2.绘制虚线(暂时设置纵坐标分5个区间)
	//虚线间距
	self.dashedSpace = (CGFloat)(self.frame.size.height - 2*MARGIN_TOP)/Y_SECTION;
	//设置虚线属性(横向线)
	CGFloat lengths[2] = {5,5};
	CGContextSetLineWidth(currentCtx, 0.2);
	CGContextSetLineDash(currentCtx, 0, lengths, 0);//1虚线间隔
	for(int index = 1; index<Y_SECTION; index++)
	{
		CGContextMoveToPoint(currentCtx, left_bottom_x + MARGIN_BETWEEN_X_POINT/3, right_top_y + MARGIN_BETWEEN_Y_POINT * index);
		CGContextAddLineToPoint(currentCtx, right_bottom_x, right_top_y + MARGIN_BETWEEN_Y_POINT * index);
	}
	CGContextStrokePath(currentCtx);
	
	//(纵向线)
	CGFloat lgths[2] = {5,5};
	CGContextSetLineDash(currentCtx, 0, lgths, 0);
	for(int index = 1; index<X_SECTION; index++)
	{
		CGContextMoveToPoint(currentCtx, left_bottom_x + MARGIN_BETWEEN_X_POINT * index, right_top_y);
		CGContextAddLineToPoint(currentCtx, left_bottom_x + MARGIN_BETWEEN_X_POINT * index, left_bottom_y);
	}
	CGContextStrokePath(currentCtx);
	
	//3.设置纵坐标值
//	self.maxYValue = [self compareForMaxValue];
//	self.yNumberSpace = self.maxYValue/Y_SECTION;
	for (int index = 1; index<Y_SECTION; index++)
	{
		if (index == (Y_SECTION - 1)) {
			break;
		}
		CGFloat labW = 30;
		CGFloat labH = MARGIN_BETWEEN_Y_POINT - 4;
		CGFloat centerX = right_bottom_x + labW/2 + 4;
		CGPoint centerPoint = CGPointMake(centerX, right_top_y + MARGIN_BETWEEN_Y_POINT * index);
		CGRect bounds = CGRectMake(0, 0, labW, labH);
		NSString *labelText = self.yScaleArray.count == 0 ? @"0A" : [self.yScaleArray objectAtIndex:index-1];//数组中的元素逆向放置
		UILabel *yNumber = [self createLabelWithCenter:centerPoint
											withBounds:bounds
											  withText:labelText
									 withtextAlignment:NSTextAlignmentRight];
		yNumber.textAlignment = NSTextAlignmentCenter;
		[self addSubview:yNumber];
	}
	
	//4.设置横坐标值
	for (int index = 1; index<X_SECTION; index++)
	{
		CGFloat labW = MARGIN_BETWEEN_X_POINT - 4;
		CGFloat labH = 20;
		CGFloat centerY = left_bottom_y + labH/2 + 4;
		CGPoint centerPoint = CGPointMake(left_bottom_x + MARGIN_BETWEEN_X_POINT * index, centerY);
		CGRect bounds = CGRectMake(0, 0, labW, labH);
		NSString *labelText = self.xScaleArray.count == 0 ? @"平" : [self.xScaleArray objectAtIndex:index-1];//数组中的元素逆向放置
		UILabel *xNumber = [self createLabelWithCenter:centerPoint
											withBounds:bounds
											  withText:labelText
									 withtextAlignment:NSTextAlignmentCenter];
		[self addSubview:xNumber];
	}
	
	CGFloat xArrowImgW = length_x;
	CGFloat xArrowImgH = 2;
	CGFloat xArrowImgX = left_bottom_x;
	CGFloat xArrowImgY = left_bottom_y - 1;
	self.xArrowImageView.frame = CGRectMake(xArrowImgX, xArrowImgY, xArrowImgW, xArrowImgH);
	[self addSubview:_xArrowImageView];
	
	CGFloat yArrowImgW = 2;
	CGFloat yArrowImgH = length_y;
	CGFloat yArrowImgX = right_bottom_x - 1;
	CGFloat yArrowImgY = right_top_y;
	self.yArrowImageView.frame = CGRectMake(yArrowImgX, yArrowImgY, yArrowImgW, yArrowImgH);
	[self addSubview:_yArrowImageView];
}

/**
 *
 *  获取最大的纵坐标值
 */
- (int)compareForMaxValue
{
	__block int maxYValue = 0;
	//获取最大的纵坐标值
	[self.dataSource enumerateObjectsUsingBlock:^(BYCoordinateItem *obj, NSUInteger idx, BOOL *stop) {
		if ([obj.coordinateYValue intValue] > maxYValue)
		{
			maxYValue = [obj.coordinateYValue intValue];
		}
	}];
	//获取最大的纵坐标值整数
	if((maxYValue % Y_SECTION) != 0)
	{
		maxYValue = maxYValue + (Y_SECTION - maxYValue % Y_SECTION);
	}
	return maxYValue;
}

/**
 *
 *  UILabel的工厂方法
 *
 *  @param centerPoint   label的中心
 *  @param bounds        label的大小
 *  @param labelText     label的内容
 *  @param textAlignment label的内容排版方式
 *
 *  @return
 */
- (UILabel *)createLabelWithCenter:(CGPoint)centerPoint
						withBounds:(CGRect)bounds
						  withText:(NSString *)labelText
				 withtextAlignment:(NSTextAlignment)textAlignment
{
	UILabel *label = [[UILabel alloc] init];
	label.center = centerPoint;
	label.bounds = bounds;
	label.textAlignment = NSTextAlignmentCenter;
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
	label.font = [UIFont systemFontOfSize:10];
	label.textAlignment = textAlignment;
	label.text = labelText;
	
	return label;
}

#pragma mark- Setter and getter
- (UIImageView *)xArrowImageView
{
	if (!_xArrowImageView) {
		_xArrowImageView = [[UIImageView alloc] init];
		_xArrowImageView.backgroundColor = [UIColor purpleColor];
	}
	return _xArrowImageView;
}

- (UIImageView *)yArrowImageView
{
	if (!_yArrowImageView) {
		_yArrowImageView = [[UIImageView alloc] init];
		_yArrowImageView.backgroundColor = [UIColor blueColor];
	}
	return _yArrowImageView;
}

#pragma mark- Square area


@end
