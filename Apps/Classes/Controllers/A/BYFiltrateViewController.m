//
//  BYFiltrateViewController.m
//  Apps
//
//  Created by bianyong on 2018/2/7.
//  Copyright © 2018年 BY. All rights reserved.
//

#import "BYFiltrateViewController.h"
#import "QLActivityFiltrateView.h"

@interface BYFiltrateViewController ()

@property (nonatomic, strong) UIButton *filtrateBtn;
@property (nonatomic, strong) UIButton *shortcutBtn;

@end

@implementation BYFiltrateViewController

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
- (void)goFiltrate
{
    QLActivityFiltrateView *filtrateView = [[QLActivityFiltrateView alloc] init];
    [filtrateView showView];
}

- (void)createShortcut
{
    
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    
}

- (void)placeSubViews
{
    [self.view addSubview:self.filtrateBtn];
    [self.view addSubview:self.shortcutBtn];
    
    [_filtrateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    [_shortcutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(_filtrateBtn.mas_bottom).offset(40);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
}

#pragma mark- Setter and getter
- (UIButton *)filtrateBtn
{
    if (!_filtrateBtn) {
        _filtrateBtn = [[UIButton alloc] init];
        _filtrateBtn.layer.borderWidth = 1;
        _filtrateBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _filtrateBtn.layer.cornerRadius = 5;
        [_filtrateBtn setTitle:@"过滤" forState:UIControlStateNormal];
        [_filtrateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_filtrateBtn addTarget:self action:@selector(goFiltrate) forControlEvents:UIControlEventTouchUpInside];
    }
    return _filtrateBtn;
}

- (UIButton *)shortcutBtn
{
    if (!_shortcutBtn) {
        _shortcutBtn = [[UIButton alloc] init];
        _shortcutBtn.layer.borderWidth = 1;
        _shortcutBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _shortcutBtn.layer.cornerRadius = 5;
        [_shortcutBtn setTitle:@"快捷方式" forState:UIControlStateNormal];
        [_shortcutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_shortcutBtn addTarget:self action:@selector(createShortcut) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shortcutBtn;
}

@end
