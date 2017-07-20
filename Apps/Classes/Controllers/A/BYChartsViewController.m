//
//  BYChartsViewController.m
//  Apps
//
//  Created by by on 2017/7/19.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYChartsViewController.h"
#import "ImportCharts-Bridging-Header.h"

@interface BYChartsViewController ()

@end

@implementation BYChartsViewController
#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSetting];
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
    self.view.backgroundColor = BG_Color;
    
    BarChartView *bV = [[BarChartView alloc] initWithFrame:CGRectMake(50, 70, 200, 200)];
    bV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:bV];
}

#pragma mark- Setter and getter
#pragma mark- Square area

@end
