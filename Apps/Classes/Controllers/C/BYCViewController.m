//
//  BYCViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYCViewController.h"
#import "UIPlaceHolderTextView.h"
#import "UIKit+AFNetworking.h"

#define limitCount 10

@interface BYCViewController () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *tView;
@property (nonatomic, strong) UIPlaceHolderTextView *placeHolderTextView;
@property (nonatomic, strong) UIImageView *gifImageView;

@end

@implementation BYCViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initWithSetting];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	NSURL *gifUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1483511554654&di=94a4d5e47b0a2c3e43246aca113a2646&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01686256fe374032f875a9449ee89e.gif"];
	//https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1483516950271&di=87c6cd414786503e53314f60f6507cb7&imgtype=0&src=http%3A%2F%2Fsc.jb51.net%2Fuploads%2Fallimg%2F150629%2F10-15062Z9524NO.jpg
	[_gifImageView setImageWithURL:gifUrl placeholderImage:[UIImage imageNamed:@"twitterIcon"]];
	MISLogFunc
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Delegate
//UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
//	if (limitCount <= 0)
//		return NO;
//	
//	UITextRange *selectedRange = [self.tView markedTextRange];
//	//获取高亮部分
//	UITextPosition *position = [self.tView positionFromPosition:selectedRange.start offset:0];
//	
//	//不是联想输入状态
//	if (!position) {
//		if (self.tView.text.length > limitCount) {
//			self.tView.text = [self.tView.text substringToIndex:limitCount];
//		}
//	}
	
	if ([textView isKindOfClass:[UIPlaceHolderTextView class]]) {
		//隐藏键盘，实现UITextViewDelegate
		if ([text isEqualToString:@"\n"]) {
			[_placeHolderTextView resignFirstResponder];
			return NO;
		}
	}
	
	return YES;
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initWithSetting
{
	self.title = @"CView";
	
	[self.view setBackgroundColor:BG_Color];
	
	[self.view addSubview:self.tView];
	[self.view addSubview:self.placeHolderTextView];
	[self.view addSubview:self.gifImageView];
//	[self customPicture];
}

- (void)customPicture
{
	//配合paintCode获取图片路径
	UIImage *img = nil;
	CGSize areaSize = CGSizeMake(268, 268);
	//开启位图上下文
	UIGraphicsBeginImageContextWithOptions(areaSize, NO, [[UIScreen mainScreen] scale]);
	{
		//绘制路径
		UIBezierPath* bezierPath = UIBezierPath.bezierPath;
		[bezierPath moveToPoint: CGPointMake(224.5, 61.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(202.5, 69.5)];
		[bezierPath addLineToPoint: CGPointMake(188.5, 61.5)];
		[bezierPath addLineToPoint: CGPointMake(170.5, 57.5)];
		[bezierPath addLineToPoint: CGPointMake(156.5, 59.5)];
		[bezierPath addLineToPoint: CGPointMake(140.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(133.5, 90.5)];
		[bezierPath addLineToPoint: CGPointMake(133.5, 105.5)];
		[bezierPath addLineToPoint: CGPointMake(111.5, 102.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 98.5)];
		[bezierPath addLineToPoint: CGPointMake(84.5, 92.5)];
		[bezierPath addLineToPoint: CGPointMake(74.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 78.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(51.5, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 71.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 98.5)];
		[bezierPath addLineToPoint: CGPointMake(53.5, 107.5)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 116.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 116.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 111.5)];
		[bezierPath addLineToPoint: CGPointMake(46.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(51.5, 129.5)];
		[bezierPath addLineToPoint: CGPointMake(58.5, 139.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 144.5)];
		[bezierPath addLineToPoint: CGPointMake(70.5, 147.5)];
		[bezierPath addLineToPoint: CGPointMake(76.5, 150.5)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 150.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 163.5)];
		[bezierPath addLineToPoint: CGPointMake(76.5, 172.5)];
		[bezierPath addLineToPoint: CGPointMake(86.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(94.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 177.5)];
		[bezierPath addLineToPoint: CGPointMake(81.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(63.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(39.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(53.5, 201.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 205.5)];
		[bezierPath addLineToPoint: CGPointMake(81.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(97.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(113.5, 210.5)];
		[bezierPath addLineToPoint: CGPointMake(130.5, 207.5)];
		[bezierPath addLineToPoint: CGPointMake(151.5, 198.5)];
		[bezierPath addLineToPoint: CGPointMake(168.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(183.5, 172.5)];
		[bezierPath addLineToPoint: CGPointMake(194.5, 157.5)];
		[bezierPath addLineToPoint: CGPointMake(200.5, 144.5)];
		[bezierPath addLineToPoint: CGPointMake(205.5, 129.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 113.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 102.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 95.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 90.5)];
		[bezierPath addLineToPoint: CGPointMake(228.5, 76.5)];
		[bezierPath addLineToPoint: CGPointMake(217.5, 80.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 80.5)];
		[bezierPath addLineToPoint: CGPointMake(221.5, 69.5)];
		[bezierPath addLineToPoint: CGPointMake(224.5, 61.5)];
		[bezierPath closePath];
		[[UIColor whiteColor] setFill];
		[bezierPath fill];
		[BG_Color setStroke];
		bezierPath.lineWidth = 1;
		[bezierPath stroke];
	}
	//获取位图上下文（图片内容）
	img = UIGraphicsGetImageFromCurrentImageContext();
	//关闭位图上下文
	UIGraphicsEndImageContext();
	
	UIImageView *customImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 100, 100)];
	customImageView.backgroundColor = [UIColor orangeColor];
	customImageView.image = img;
	[self.view addSubview:customImageView];
}

#pragma mark- Setter and getter
- (UITextView *)tView
{
	if (!_tView) {
		_tView = [[UITextView alloc] initWithFrame:CGRectMake(10, 190, 200, 30)];
		_tView.delegate = self;
	}
	return _tView;
}

- (UIPlaceHolderTextView *)placeHolderTextView
{
	if (!_placeHolderTextView) {
		_placeHolderTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(10, 250, 200, 100)];
		_placeHolderTextView.delegate = self;
		_placeHolderTextView.placeHolder = @"placeHolder测试";
		_placeHolderTextView.placeHolderColor = [UIColor orangeColor];
	}
	return _placeHolderTextView;
}

- (UIImageView *)gifImageView
{
	if (!_gifImageView) {
		_gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 360, 100, 100)];
	}
	return _gifImageView;
}

#pragma mark- Square area

@end
