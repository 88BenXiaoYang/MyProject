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
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    self.view.backgroundColor = [UIColor orangeColor];
    
    //method swizzling
    Class class = [self class];
    
    SEL ATBSelector = @selector(methodSwizzlingA);
    SEL BTASelector = @selector(methodSwizzlingB);
    
    Method ATBMethod = class_getInstanceMethod(class, ATBSelector);
    Method BTAMethod = class_getInstanceMethod(class, BTASelector);
    
    method_exchangeImplementations(ATBMethod, BTAMethod);
}

- (void)placeSubViews
{
    [self.view addSubview:self.methodABtn];
    [self.view addSubview:self.methodBBtn];
}

- (void)methodSwizzlingA
{
    NSLog(@"methodSwizzling AAA");
}

- (void)methodSwizzlingB
{
    NSLog(@"methodSwizzling BBB");
}

#pragma mark- Setter and getter
- (UIButton *)methodABtn
{
    if (!_methodABtn) {
        _methodABtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
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
        [_methodBBtn setTitle:@"BBB" forState:UIControlStateNormal];
        [_methodBBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_methodBBtn addTarget:self action:@selector(methodSwizzlingB) forControlEvents:UIControlEventTouchUpInside];
    }
    return _methodBBtn;
}

@end
