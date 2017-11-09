//
//  BYCustomMaskView.m
//  Apps
//
//  Created by bianyong on 2017/11/9.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYCustomMaskView.h"

@implementation BYCustomMaskView
#pragma mark- Live circle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self prepare];
        [self placeSubViews];
    }
    return self;
}

#pragma mark- Overwrite
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hideMaskView];
}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
- (void)showMaskView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor orangeColor];
}

- (void)placeSubViews
{
    
}

- (void)hideMaskView
{
    NSLog(@"%s", __func__);
    
    [UIView animateWithDuration:0.25 animations:^{
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark- Setter and getter

@end
