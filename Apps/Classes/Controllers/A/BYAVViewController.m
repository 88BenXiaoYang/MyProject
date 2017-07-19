//
//  BYAVViewController.m
//  Apps
//
//  Created by by on 2017/7/5.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYAVViewController.h"

@interface BYAVViewController ()

@property (nonatomic, strong) UIButton *playBtn;

@end

@implementation BYAVViewController
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
 - (void)playVideo
{
    
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
    self.view.backgroundColor = BG_Color;
    [self.view addSubview:self.playBtn];
}

#pragma mark- Setter and getter
- (UIButton *)playBtn
{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 70, 100, 30)];
        _playBtn.layer.cornerRadius = 5;
        _playBtn.backgroundColor = WHITE_COLOR;
        [_playBtn setTitle:@"playVideo" forState:UIControlStateNormal];
        [_playBtn setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
#pragma mark- Square area

@end
