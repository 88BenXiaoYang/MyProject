//
//  BYLineChartView.m
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYLineChartView.h"
#import "BYCoordinateItem.h"

#define ANIMATION_DURING 2
#define LINE_WIDTH  1

@interface BYLineChartView ()

@property (nonatomic, strong) UIColor *lineAndPointColor;
@property (nonatomic, assign) BOOL isAnimation;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation BYLineChartView
//- (id)init
//{
//	if (self = [super init]) {
//		[self buildDataSource];
//		self.lineAndPointColor = [UIColor redColor];
//		self.isAnimation = NO;
//		self.backgroundColor = [UIColor clearColor];
//	}
//	return self;
//}

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
		   withAnimation:(BOOL)isAnimation
{
	self = [super initWithDataSource:dataSourceDic];
	if (self)
	{
		self.dataSource = dataSourceDic[@"coordinateArray"];
		self.lineAndPointColor = color;
		self.isAnimation = isAnimation;
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code
	[super drawRect:rect];
	
	CGContextRef currentCtx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(currentCtx, self.lineAndPointColor.CGColor);
	CGContextSetStrokeColorWithColor(currentCtx, self.lineAndPointColor.CGColor);
	CGContextSetLineWidth(currentCtx, 1);
	
	//绘制坐标点
	NSMutableArray *coordinateArray = [NSMutableArray arrayWithCapacity:0];
	NSMutableArray *initCoordinateArray = [NSMutableArray arrayWithCapacity:0];
	
	//point
	CGFloat length_x = X_SECTION * MARGIN_BETWEEN_X_POINT;
	CGFloat length_y = Y_SECTION * MARGIN_BETWEEN_Y_POINT;
	
	CGFloat left_bottom_x = (self.bounds.size.width - length_x)/2;
	CGFloat right_top_y = (self.bounds.size.height - length_y)/2;
	
	for (int index = 0; index<[self.dataSource count]; index++)
	{
		BYCoordinateItem *item = [self.dataSource objectAtIndex:index];
		/**
		 *  self.dashedSpace/self.yNumberSpace:计算纵轴上点与点间距(1和2、2和3)
		 */
		CGPoint itemCoordinate = CGPointMake(left_bottom_x + [item.coordinateXValue integerValue], self.frame.size.height - (right_top_y + [item.coordinateYValue integerValue]));
//		CGPoint itemCoordinate = CGPointMake(left_bottom_x + index * MARGIN_BETWEEN_X_POINT,
//											 self.frame.size.height - (right_top_y + [item.coordinateYValue integerValue]));
		//记录坐标点
		[coordinateArray addObject:NSStringFromCGPoint(itemCoordinate)];
		CGContextAddArc(currentCtx, itemCoordinate.x, itemCoordinate.y, 4, 0, 2*M_PI, 1);
		CGContextFillPath(currentCtx);
		//记录初始化坐标点，方便后续动画
		itemCoordinate.y = self.frame.size.height - right_top_y;
		[initCoordinateArray addObject:NSStringFromCGPoint(itemCoordinate)];
	}
	CGContextStrokePath(currentCtx);
	
	//绘制折线
	//避免折线虚线化
	CGContextSetLineDash(currentCtx, 0, 0, 0);
	//绘图路线
	CGMutablePathRef path = CGPathCreateMutable();
	for (int index = 0; index<[coordinateArray count] - 1; index++)
	{
		//一段折线开始点
		NSString *startPointStr = [coordinateArray objectAtIndex:index];
		CGPoint startPoint = CGPointFromString(startPointStr);
		
		//一段折线结束点
		NSString *endPointStr = [coordinateArray objectAtIndex:index+1];
		CGPoint endPoint = CGPointFromString(endPointStr);
		
		//绘制图线方法一：每一段折线都是用一个path,动画过程就变成分动动画,而且是同时执行的。
		//        [self drawLineWithStartPoint:startPoint
		//                        withEndPoint:endPoint];
		
		//绘制图线方法二：所有的绘图信息放在同一个path中,动画过程就变成连续的了。
		[self drawLineWithPath:path
				withStartPoint:startPoint
				  withEndPoint:endPoint];
		
		/*  使用CoreGraphics直接绘制
		 CGContextMoveToPoint(currentCtx, startPoint.x, startPoint.y);
		 CGContextAddLineToPoint(currentCtx, endPoint.x, endPoint.y);
		 */
	}
	CGContextStrokePath(currentCtx);
	CGPathRelease(path);
}

/**
 *
 *  绘制折线
 *
 *  @param startPoint     折线的开始点
 *  @param endPoint       折线的结束点
 */
- (void)drawLineWithStartPoint:(CGPoint)startPoint
				  withEndPoint:(CGPoint)endPoint
{
	CAShapeLayer *lineLayer = [CAShapeLayer layer];
	lineLayer.lineWidth = 1;
	lineLayer.lineCap = kCALineCapButt;
	lineLayer.strokeColor = self.lineAndPointColor.CGColor;
	lineLayer.fillColor = nil;
	
	CGMutablePathRef linePath = CGPathCreateMutable();
	CGPathMoveToPoint(linePath, nil, startPoint.x, startPoint.y);
	CGPathAddLineToPoint(linePath, nil, endPoint.x, endPoint.y);
	lineLayer.path = linePath;
	
	if (self.isAnimation)
	{
		CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
		pathAnimation.duration = ANIMATION_DURING;
		pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
		pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
		pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
		pathAnimation.autoreverses = NO;
		pathAnimation.fillMode = kCAFillModeForwards;
		[lineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
	}
	
	//    self.clipsToBounds = YES;
	[self.layer addSublayer:lineLayer];
	CGPathRelease(linePath);
}

/**
 *
 *  绘制折线
 *
 *  @param path       保存绘图信息的路径
 *  @param startPoint 折线的开始点
 *  @param endPoint   折线的结束点
 */
- (void)drawLineWithPath:(CGMutablePathRef )path
		  withStartPoint:(CGPoint)startPoint
			withEndPoint:(CGPoint)endPoint
{
	CAShapeLayer *lineLayer = [CAShapeLayer layer];
	lineLayer.lineWidth = LINE_WIDTH;
	lineLayer.lineCap = kCALineCapButt;
	lineLayer.strokeColor = self.lineAndPointColor.CGColor;
	lineLayer.fillColor = nil;
	
	CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y);
	CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y);
	lineLayer.path = path;
	
	if (self.isAnimation)
	{
		CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
		pathAnimation.duration = ANIMATION_DURING;
		pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
		pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
		pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
		pathAnimation.autoreverses = NO;
		pathAnimation.fillMode = kCAFillModeForwards;
		[lineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
	}
	
	//    self.clipsToBounds = YES;
	[self.layer addSublayer:lineLayer];
}

/**
 *
 *  构建数据源
 */
- (void)buildDataSource
{
	[self.dataSource removeAllObjects];
	
	BYCoordinateItem *item = [[BYCoordinateItem alloc] initWithXValue:@"15"
														   withYValue:@"15"
															withColor:[UIColor redColor]];
	[self.dataSource addObject:item];
	
	BYCoordinateItem *item1 = [[BYCoordinateItem alloc] initWithXValue:@"10"
															withYValue:@"60"
															 withColor:[UIColor greenColor]];
	[self.dataSource addObject:item1];
	
	BYCoordinateItem *item2 = [[BYCoordinateItem alloc] initWithXValue:@"10"
															withYValue:@"10"
															 withColor:[UIColor blueColor]];
	[self.dataSource addObject:item2];
	
	BYCoordinateItem *item3 = [[BYCoordinateItem alloc] initWithXValue:@"60"
															withYValue:@"60"
															 withColor:[UIColor grayColor]];
	[self.dataSource addObject:item3];
	
	
	BYCoordinateItem *item4 = [[BYCoordinateItem alloc] initWithXValue:@"35"
															withYValue:@"80"
															 withColor:[UIColor blackColor]];
	[self.dataSource addObject:item4];
	return;
	BYCoordinateItem *item5 = [[BYCoordinateItem alloc] initWithXValue:@"5"
															withYValue:@"5"
															 withColor:[UIColor lightGrayColor]];
	[self.dataSource addObject:item5];
	
	BYCoordinateItem *item6 = [[BYCoordinateItem alloc] initWithXValue:@"6"
															withYValue:@"11"
															 withColor:[UIColor yellowColor]];
	[self.dataSource addObject:item6];
	
	BYCoordinateItem *item7 = [[BYCoordinateItem alloc] initWithXValue:@"7"
															withYValue:@"9"
															 withColor:[UIColor purpleColor]];
	[self.dataSource addObject:item7];
	
	BYCoordinateItem *item8 = [[BYCoordinateItem alloc] initWithXValue:@"8"
															withYValue:@"5"
															 withColor:[UIColor yellowColor]];
	[self.dataSource addObject:item8];
	
	BYCoordinateItem *item9 = [[BYCoordinateItem alloc] initWithXValue:@"9"
															withYValue:@"9"
															 withColor:[UIColor purpleColor]];
	[self.dataSource addObject:item9];
}

- (NSMutableArray *)dataSource
{
	if (!_dataSource) {
		_dataSource = [NSMutableArray array];
	}
	return _dataSource;
}

@end
