//
//  BYNavigationTitleView.m
//  Apps
//
//  Created by bianyong on 2017/11/8.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYNavigationTitleView.h"

@interface BYNavigationTitleView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *indicateImageView;
@property (nonatomic, strong) UIButton *showBtn;

@end

@implementation BYNavigationTitleView
#pragma mark- Live circle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        [self placeSubViews];
    }
    return self;
}

#pragma mark- Overwrite
- (CGSize)intrinsicContentSize
{
    return self.bounds.size;
}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)showContentDetail:(UIButton *)sender
{
    if (self.navigationTitleViewBlock) {
        self.navigationTitleViewBlock();
    }
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLab];
    [self addSubview:self.indicateImageView];
    [self addSubview:self.showBtn];
}

- (void)placeSubViews
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerY.equalTo(self);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.right.equalTo(_indicateImageView.mas_left).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self);
    }];
    
    [self.indicateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.centerY.equalTo(self);
    }];
    
    [self.showBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark- Setter and getter
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor orangeColor];
    }
    return _iconImageView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}

- (UIImageView *)indicateImageView
{
    if (!_indicateImageView) {
        _indicateImageView = [[UIImageView alloc] init];
        _indicateImageView.backgroundColor = [UIColor purpleColor];
    }
    return _indicateImageView;
}

- (UIButton *)showBtn
{
    if (!_showBtn) {
        _showBtn = [[UIButton alloc] init];
        [_showBtn addTarget:self action:@selector(showContentDetail:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}

@end
