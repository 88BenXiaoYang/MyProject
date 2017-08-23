//
//  BYEViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYEViewController.h"

@interface BYEViewController ()

@property (nonatomic, strong) UIImageView *customActivityImageView;

@end

@implementation BYEViewController
#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EView";
    [self.view addSubview:self.customActivityImageView];
    [self animationA];
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
- (void)animationA
{
    [UIView animateWithDuration:0.03 animations:^{
        CGFloat degree = 0.04f * M_PI;
        self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             CGFloat degree = 0.04f * M_PI;
                             self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
                             [self animationA];
                         }
                     }];
}

- (void)animationB
{
    [UIView beginAnimations:@"animationID" context:NULL];
    [UIView setAnimationDuration:0.1];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:5];
    CGFloat degree = 0.04f * M_PI;
    self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
    [UIView commitAnimations];
}

#pragma mark- Setter and getter
- (UIImageView *)customActivityImageView
{
    if (!_customActivityImageView) {
        _customActivityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
        _customActivityImageView.backgroundColor = [UIColor clearColor];
        _customActivityImageView.image = Image_With_Name(@"refresh_round_arrow");
    }
    return _customActivityImageView;
}

#pragma mark- Square area

@end
