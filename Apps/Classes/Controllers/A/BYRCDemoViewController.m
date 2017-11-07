//
//  BYRCDemoViewController.m
//  Apps
//
//  Created by by on 2017/9/17.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYRCDemoViewController.h"
#import "RTLabel.h"

@interface BYRCDemoViewController ()

@property (nonatomic, strong) RTLabel *rtLab;

@end

@implementation BYRCDemoViewController
#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepare];
    [self placeSubViews];
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
- (void)prepare
{
    [self.view addSubview:self.rtLab];
}

- (void)placeSubViews
{
    
}

#pragma mark- Setter and getter
- (RTLabel *)rtLab
{
    if (!_rtLab) {
        _rtLab = [[RTLabel alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
        _rtLab.backgroundColor = [UIColor orangeColor];
        _rtLab.text = @"<a href='http://www.baidu.com'>www.baidu.com</a>";
    }
    return _rtLab;
}

#pragma mark- Square area

@end
