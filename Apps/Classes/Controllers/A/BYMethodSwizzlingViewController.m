//
//  BYMethodSwizzlingViewController.m
//  Apps
//
//  Created by bianyong on 2017/11/15.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYMethodSwizzlingViewController.h"

@interface BYMethodSwizzlingViewController ()

@property (nonatomic, strong) UIButton *methodABtn;
@property (nonatomic, strong) UIButton *methodBBtn;

@property (nonatomic, strong) UIView *aView;
@property (nonatomic, strong) UIView *bView;
@property (nonatomic, strong) UIView *cView;

@end

@implementation BYMethodSwizzlingViewController
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
- (void)methodSwizzlingA
{
    NSLog(@"methodSwizzling AAA");
    NSLog(@"original view coo : %@", self.bView);
    NSLog(@"original view to window :");
    CGPoint originalPoint = CGPointMake(CGRectGetMaxX(self.bView.frame), CGRectGetMinX(self.bView.frame));
    NSLog(@"original coo : x : %f \n y : %f", originalPoint.x, originalPoint.y);
    CGPoint destPoint = [self.bView.superview convertPoint:originalPoint toView:[UIApplication sharedApplication].keyWindow];
    NSLog(@"dest coo in window : x : %f \n y : %f", destPoint.x, destPoint.y);
}

- (void)methodSwizzlingB
{
    NSLog(@"methodSwizzling BBB");
    
    CGPoint originalPoint = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    NSLog(@"original point :\n x : %f \n y : %f", originalPoint.x, originalPoint.y);
    CGPoint destPoint = [self.aView convertPoint:originalPoint fromView:[UIApplication sharedApplication].keyWindow];
    NSLog(@"dest : point :\n x : %f \n y : %f", destPoint.x, destPoint.y);
    
    if (destPoint.x > CGRectGetWidth(self.aView.frame)) {
        destPoint.x = destPoint.x - CGRectGetWidth(self.aView.frame);
    }
    
    [self.cView removeFromSuperview];
    CGRect frame = self.cView.frame;
    frame.origin.x = destPoint.x;
    frame.origin.y = destPoint.y;
    self.cView.frame = frame;
    [self.aView addSubview:self.cView];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.view.backgroundColor = [UIColor orangeColor];
    
//    [self swizzlingMethod];
}

- (void)placeSubViews
{
    [self.view addSubview:self.methodABtn];
    [self.view addSubview:self.methodBBtn];
    [self.view addSubview:self.aView];
    [self.view addSubview:self.cView];
}

- (void)swizzlingMethod
{
    //method swizzling
    Class class = [self class];
    
    SEL ATBSelector = @selector(methodSwizzlingA);
    SEL BTASelector = @selector(methodSwizzlingB);
    
    Method ATBMethod = class_getInstanceMethod(class, ATBSelector);
    Method BTAMethod = class_getInstanceMethod(class, BTASelector);
    
    method_exchangeImplementations(ATBMethod, BTAMethod);
}

#pragma mark- Setter and getter
- (UIButton *)methodABtn
{
    if (!_methodABtn) {
        _methodABtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
        _methodABtn.layer.cornerRadius = 5.0f;
        _methodABtn.layer.borderWidth = 1.0f;
        _methodABtn.layer.borderColor = [UIColor whiteColor].CGColor;
        [_methodABtn setTitle:@"AAA" forState:UIControlStateNormal];
        [_methodABtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_methodABtn addTarget:self action:@selector(methodSwizzlingA) forControlEvents:UIControlEventTouchUpInside];
    }
    return _methodABtn;
}

- (UIButton *)methodBBtn
{
    if (!_methodBBtn) {
        _methodBBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
        _methodBBtn.layer.cornerRadius = 5.0f;
        _methodBBtn.layer.borderWidth = 1.0f;
        _methodBBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        [_methodBBtn setTitle:@"BBB" forState:UIControlStateNormal];
        [_methodBBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_methodBBtn addTarget:self action:@selector(methodSwizzlingB) forControlEvents:UIControlEventTouchUpInside];
    }
    return _methodBBtn;
}

- (UIView *)aView
{
    if (!_aView) {
        _aView = [[UIView alloc] initWithFrame:CGRectMake(50, 210, 100, 100)];
        _aView.backgroundColor = [UIColor whiteColor];
        
        [_aView addSubview:self.bView];
    }
    return _aView;
}

- (UIView *)bView
{
    if (!_bView) {
        _bView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        _bView.backgroundColor = [UIColor redColor];
    }
    return _bView;
}

- (UIView *)cView
{
    if (!_cView) {
        _cView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _cView.backgroundColor = [UIColor purpleColor];
        _cView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    }
    return _cView;
}

@end
