//
//  BYCAAnimationViewController.m
//  Apps
//
//  Created by bianyong on 2017/11/13.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYCAAnimationViewController.h"

@interface BYCAAnimationViewController ()

@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation BYCAAnimationViewController
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
- (void)swipe:(UISwipeGestureRecognizer *)swipe
{
    NSString *dir = nil;
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.currentIndex ++;
        if (self.currentIndex >= self.colorArray.count) {
            self.currentIndex = 0;
        }
        
        self.contentImageView.backgroundColor = self.colorArray[self.currentIndex];
        
        dir = @"fromRight";
        
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        self.currentIndex --;
        if (self.currentIndex < 0) {
            self.currentIndex = self.colorArray.count - 1;
        }
        
        self.contentImageView.backgroundColor = self.colorArray[self.currentIndex];
        
        dir = @"fromLeft";
    }
    
    //add animation
    CATransition *animation = [CATransition animation];
    animation.type = @"cube"; //类型
    animation.subtype = dir;//方向 default -> fromRight
    animation.duration = 0.5;
    [self.contentImageView.layer addAnimation:animation forKey:nil];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.currentIndex = 0;
    //color data
    self.colorArray = @[[UIColor purpleColor], [UIColor orangeColor], [UIColor redColor], [UIColor greenColor]];
}

- (void)placeSubViews
{
    [self.view addSubview:self.contentImageView];
}

#pragma mark- Setter and getter
- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT - 100)];
        _contentImageView.userInteractionEnabled = YES;
        _contentImageView.backgroundColor = self.colorArray[0];
        
        //add gesture
        UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [_contentImageView addGestureRecognizer:leftSwipe];
        
        UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
        [_contentImageView addGestureRecognizer:rightSwipe];
    }
    return _contentImageView;
}

@end
