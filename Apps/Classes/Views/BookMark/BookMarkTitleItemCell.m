//
//  BookMarkTitleItemCell.m
//  tmpProject
//
//  Created by bianyong on 2017/11/3.
//  Copyright © 2017年 bianyong. All rights reserved.
//

#import "BookMarkTitleItemCell.h"

#define kSliderViewHeight 1.5

@interface BookMarkTitleItemCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIView *sliderView;

@end

@implementation BookMarkTitleItemCell
#pragma mark- Live circle
//If you registered a class for the specified identifier and a new cell must be created, this method initializes the cell by calling its initWithFrame: method
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
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)placeSubViews
{
    self.titleLab.frame = self.bounds;
    [self.contentView addSubview:self.titleLab];
    
    self.sliderView.frame = CGRectMake(0, self.bounds.size.height - kSliderViewHeight, self.bounds.size.width, kSliderViewHeight);
    [self.contentView addSubview:self.sliderView];
}

- (void)normalStyle
{
    self.sliderView.hidden = YES;
    self.titleLab.textColor = [UIColor blackColor];
}

- (void)selectedStyle
{
    self.sliderView.hidden = NO;
    self.titleLab.textColor = [UIColor orangeColor];
}

#pragma mark- Setter and getter
- (void)setSelected:(BOOL)selected
{
    selected ? [self selectedStyle] : [self normalStyle];
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"Tit";
        _titleLab.backgroundColor = [UIColor yellowColor];
    }
    return _titleLab;
}

- (UIView *)sliderView
{
    if (!_sliderView) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = [UIColor blueColor]; //default color is blueColor
    }
    return _sliderView;
}

- (void)setSliderColor:(UIColor *)sliderColor
{
    self.sliderView.backgroundColor = sliderColor;
}

@end
