//
//  BYAppSkipViewController.m
//  Apps
//
//  Created by BianYong on 17/2/28.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYAppSkipViewController.h"
#import <StoreKit/StoreKit.h>
#import "UIPlaceHolderTextView.h"

@interface BYAppSkipViewController () <UITextViewDelegate, SKStoreProductViewControllerDelegate>

@property (nonatomic, strong) UIPlaceHolderTextView *placeHolderTextView;

@end

@implementation BYAppSkipViewController
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
	
	[self appSkipToAppStore];
	[self customPlaceHolderTextView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
//UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	if ([textView isKindOfClass:[UIPlaceHolderTextView class]]) {
		//隐藏键盘，实现UITextViewDelegate
		if ([text isEqualToString:@"\n"]) {
			[_placeHolderTextView resignFirstResponder];
			return NO;
		}
	}
	
	return YES;
}

//应用内跳转到AppStore界面取消按钮监听
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)btn:(UIButton *)btn{
	//注！！！真机下才能测试
	if (btn.tag == 1) {
		//第一种方法  直接跳转
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/zhong-qing-he-jiao-yu-jia/id899039388"]];
	}else if (btn.tag == 2){
		//第二中方法  应用内跳转
		//1:导入StoreKit.framework,控制器里面添加框架#import <StoreKit/StoreKit.h>
		//2:实现代理SKStoreProductViewControllerDelegate
		SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
		storeProductViewContorller.delegate = self;
		//        ViewController *viewc = [[ViewController alloc]init];
		//        __weak typeof(viewc) weakViewController = viewc;
		
		//加载一个新的视图展示
		[storeProductViewContorller loadProductWithParameters:
		 //appId
		 @{SKStoreProductParameterITunesItemIdentifier : @"899039388"} completionBlock:^(BOOL result, NSError *error) {
			 //回调
			 if(error){
				 NSLog(@"错误%@",error);
			 }else{
				 //AS应用界面
				 [self presentViewController:storeProductViewContorller animated:YES completion:nil];
			 }
		 }];
	} else {
		
	}
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"应用跳转到AppStore";
	self.view.backgroundColor = BG_Color;
}

- (void)appSkipToAppStore
{
	//第一种方法  直接跳转
	UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 50)];
	btn.backgroundColor = [UIColor orangeColor];
	[btn setTitle:@"直接跳转" forState:UIControlStateNormal];
	btn.tag = 1;
	[btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
	//第二中方法  应用内跳转
	UIButton *btnT = [[UIButton alloc]initWithFrame:CGRectMake(10, 70, 100, 50)];
	btnT.backgroundColor = [UIColor orangeColor];
	btnT.tag = 2;
	[btnT setTitle:@"应用内跳转" forState:UIControlStateNormal];
	[btnT addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	[self.view addSubview:btnT];
}

- (void)customPlaceHolderTextView
{
	[self.view addSubview:self.placeHolderTextView];
}

#pragma mark- Setter and getter
- (UIPlaceHolderTextView *)placeHolderTextView
{
	if (!_placeHolderTextView) {
		_placeHolderTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(10, 130, 100, 50)];
		_placeHolderTextView.delegate = self;
		_placeHolderTextView.font = NFont(10);
		_placeHolderTextView.placeHolder = @"placeHolder测试";
		_placeHolderTextView.placeHolderColor = [UIColor orangeColor];
	}
	return _placeHolderTextView;
}

#pragma mark- Square area

@end
