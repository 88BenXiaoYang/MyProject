//
//  BYChartViewController.m
//  Apps
//
//  Created by BianYong on 17/3/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYChartViewController.h"
#import "BYBaseCoordinateView.h"
#import "BYLineChartView.h"
#import "BYCoordinateItem.h"

@interface BYChartViewController ()

@property (nonatomic, strong) BYBaseCoordinateView *coordinateView;
@property (nonatomic, strong) BYLineChartView *lineChartView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableDictionary *dataSourceDic;

@end

@implementation BYChartViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initSetting];
	[self layoutChartView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"ChartView";
	self.view.backgroundColor = BG_Color;
	
	[self buildDataSource];
}

- (void)layoutChartView
{
//	[self.view addSubview:self.coordinateView];
	[self.view addSubview:self.lineChartView];
}

/**
 *
 *  构建数据源
 */
- (void)buildDataSource
{
	[self.dataSource removeAllObjects];
	
	BYCoordinateItem *item = [[BYCoordinateItem alloc] initWithXValue:@"90"
														   withYValue:@"90"
															withColor:[UIColor redColor]];
	[self.dataSource addObject:item];
	
	
	BYCoordinateItem *item1 = [[BYCoordinateItem alloc] initWithXValue:@"90"
															withYValue:@"180"
															 withColor:[UIColor greenColor]];
	[self.dataSource addObject:item1];
	
	BYCoordinateItem *item2 = [[BYCoordinateItem alloc] initWithXValue:@"20"
															withYValue:@"40"
															 withColor:[UIColor blueColor]];
	[self.dataSource addObject:item2];
	
	BYCoordinateItem *item3 = [[BYCoordinateItem alloc] initWithXValue:@"30"
															withYValue:@"30"
															 withColor:[UIColor grayColor]];
	[self.dataSource addObject:item3];
	
	BYCoordinateItem *item4 = [[BYCoordinateItem alloc] initWithXValue:@"40"
															withYValue:@"60"
															 withColor:[UIColor blackColor]];
	[self.dataSource addObject:item4];
	
	BYCoordinateItem *item5 = [[BYCoordinateItem alloc] initWithXValue:@"50"
															withYValue:@"50"
															 withColor:[UIColor lightGrayColor]];
	[self.dataSource addObject:item5];
	
	BYCoordinateItem *item6 = [[BYCoordinateItem alloc] initWithXValue:@"60"
															withYValue:@"90"
															 withColor:[UIColor yellowColor]];
	[self.dataSource addObject:item6];
	
	BYCoordinateItem *item7 = [[BYCoordinateItem alloc] initWithXValue:@"70"
															withYValue:@"90"
															 withColor:[UIColor purpleColor]];
	[self.dataSource addObject:item7];
	
	BYCoordinateItem *item8 = [[BYCoordinateItem alloc] initWithXValue:@"80"
															withYValue:@"50"
															 withColor:[UIColor yellowColor]];
	[self.dataSource addObject:item8];
	
	BYCoordinateItem *item9 = [[BYCoordinateItem alloc] initWithXValue:@"120"
															withYValue:@"90"
															 withColor:[UIColor purpleColor]];
	[self.dataSource addObject:item9];
	 /**/
	
	self.dataSourceDic[@"coordinateArray"] = self.dataSource;
	self.dataSourceDic[@"xScaleArray"] = @[@"尖", @"峰", @"平", @"谷", @"平", @"谷"];
	
	NSMutableArray *yScaleArray = [NSMutableArray array];
	for (int i = Y_SECTION; i > 0; i--) {
		NSString *scaleStr = [NSString stringWithFormat:@"%d0A", i];
		[yScaleArray addObject:scaleStr];
	}
	self.dataSourceDic[@"yScaleArray"] = yScaleArray;
}

#pragma mark- Setter and getter
- (BYBaseCoordinateView *)coordinateView
{
	if (!_coordinateView) {
		_coordinateView = [[BYBaseCoordinateView alloc] init];
		_coordinateView.frame = CGRectMake(0, 10, self.view.bounds.size.width, 300);
		_coordinateView.backgroundColor = [UIColor yellowColor];
	}
	return _coordinateView;
}

- (BYLineChartView *)lineChartView
{
	if (!_lineChartView) {
		_lineChartView = [[BYLineChartView alloc] initWithDataSource:self.dataSourceDic withLineAndPointColor:[UIColor redColor] withAnimation:YES];
		_lineChartView.frame = CGRectMake(0, 10, self.view.bounds.size.width, 300);
		_lineChartView.backgroundColor = [UIColor orangeColor];
	}
	return _lineChartView;
}

- (NSMutableArray *)dataSource
{
	if (!_dataSource) {
		_dataSource = [NSMutableArray array];
	}
	return _dataSource;
}

- (NSMutableDictionary *)dataSourceDic
{
	if (!_dataSourceDic) {
		_dataSourceDic = [NSMutableDictionary dictionary];
	}
	return _dataSourceDic;
}

#pragma mark- Square area

@end
