//
//  BYSwitchAViewController.m
//  Apps
//
//  Created by BianYong on 17/3/1.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYSwitchAViewController.h"
#import "BYSwitchBViewController.h"

@interface BYSwitchAViewController ()

@property (nonatomic, strong) UIButton *switchToBVCBtn;

@end

@implementation BYSwitchAViewController
#pragma mark- Live circle
- (id)init
{
	if (self = [super init]) {
		[self initSetting];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.view addSubview:self.switchToBVCBtn];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)switchToB:(UIButton *)sender
{
	//界面切换动画设置
	BYSwitchBViewController *bVC = [[BYSwitchBViewController alloc] init];
	/*
	 //界面切换后隐藏导航栏
	 //CoverVertical：垂直向上
	 //FlipHorizontal：水平翻转
	 //CrossDissolve：溶解
	 //PartialCurl：翻书效果
	 [bVC setModalTransitionStyle:UIModalTransitionStylePartialCurl];
	 [self presentViewController:bVC animated:YES completion:nil];
	 */
	
	/*
	 //界面切换动画设置 --- 动画可在layer上控制
	 CATransition* transition = [CATransition animation];
	 transition.type = kCATransitionPush;
	 transition.subtype = kCATransitionFromTop;//左右是相对上一层而言，顶部、底部是相对自身而言；subtype效果要在设置type之后，再设置subtype，subtype效果才生效
	 [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
	 [self.navigationController pushViewController:bVC animated:NO];
	 */
	
	 //翻书效果，保留导航栏
	 [UIView beginAnimations:nil context:NULL];
	 [UIView setAnimationDuration:1];
	 [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:[UIApplication sharedApplication].keyWindow.rootViewController.view cache:NO];
	 [self.navigationController pushViewController:bVC animated:NO];
	 [UIView commitAnimations];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"Switch_A";
	self.view.backgroundColor = BG_Color;
}

#pragma mark- Setter and getter
- (UIButton *)switchToBVCBtn
{
	if (!_switchToBVCBtn) {
		_switchToBVCBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 150, 40)];
		_switchToBVCBtn.backgroundColor = WHITE_COLOR;
		_switchToBVCBtn.layer.cornerRadius = 5;
		_switchToBVCBtn.titleLabel.font = NFont(14);
		[_switchToBVCBtn setTitle:@"SwitchToBVC" forState:UIControlStateNormal];
		[_switchToBVCBtn setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
		[_switchToBVCBtn addTarget:self action:@selector(switchToB:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _switchToBVCBtn;
}

#pragma mark- Square area

@end
