//
//  BookMarkContentItemCell.m
//  tmpProject
//
//  Created by bianyong on 2017/11/3.
//  Copyright © 2017年 bianyong. All rights reserved.
//

#import "BookMarkContentItemCell.h"

@implementation BookMarkContentItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        [self placeSubViews];
    }
    return self;
}

- (void)prepare
{
    self.contentView.backgroundColor = [UIColor purpleColor];
}

- (void)placeSubViews
{
    
}

#pragma mark- setter and getter
- (void)setCustomContentView:(UIView *)customContentView
{
    if (_customContentView) {
        [_customContentView removeFromSuperview];
    }
    
    _customContentView = customContentView;
    _customContentView.frame = self.bounds;
    [self.contentView addSubview:_customContentView];
}

@end
