//
//  BYADScrollerViewController.m
//  Apps
//
//  Created by by on 2017/11/19.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYADScrollerViewController.h"
#import "BYADDetailViewController.h"

#define kCommonBtnTag 1000

@interface BYADScrollerViewController ()

@property (nonatomic, strong) UIButton *adBtnA;

@end

@implementation BYADScrollerViewController
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
- (void)goADView:(UIButton *)btn
{
    BYADDetailViewController *adDetailVC = [[BYADDetailViewController alloc] init];
    adDetailVC.title = @"adDetail";
    [self.navigationController pushViewController:adDetailVC animated:YES];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.view.backgroundColor = BG_Color;
}

- (void)placeSubViews
{
    [self.view addSubview:self.adBtnA];
}

#pragma mark- Setter and getter
- (UIButton *)adBtnA
{
    if (!_adBtnA) {
        _adBtnA = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
        _adBtnA.tag = kCommonBtnTag + 1;
        _adBtnA.layer.cornerRadius = 5.0f;
        _adBtnA.layer.borderWidth = 1.0f;
        _adBtnA.layer.borderColor = [UIColor whiteColor].CGColor;
        [_adBtnA setTitle:@"adBtnA" forState:UIControlStateNormal];
        [_adBtnA setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_adBtnA addTarget:self action:@selector(goADView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _adBtnA;
}

@end
