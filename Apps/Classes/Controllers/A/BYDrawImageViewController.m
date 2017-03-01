//
//  BYDrawImageViewController.m
//  Apps
//
//  Created by BianYong on 17/3/1.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYDrawImageViewController.h"

#define limitCount 10

@interface BYDrawImageViewController () <UITextViewDelegate>

@property (nonatomic, strong) UIView *textViewBgView;
@property (nonatomic, strong) UITextView *tView;

@end

@implementation BYDrawImageViewController
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
	
	[self bezierPathPicture];
	[self.view addSubview:self.textViewBgView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
//UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	//限制字数时，英文字符输入指定字数后不能继续输入，汉字情况下有联想词语时还能继续输入！！！
	if (limitCount <= 0)
		return NO;
	
	UITextRange *selectedRange = [self.tView markedTextRange];
	//获取高亮部分
	UITextPosition *position = [self.tView positionFromPosition:selectedRange.start offset:0];
	
	//不是联想输入状态
	if (!position) {
		if (self.tView.text.length > limitCount) {
			self.tView.text = [self.tView.text substringToIndex:limitCount];
		}
	}
	
	return YES;
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"BezierPath";
	self.view.backgroundColor = BG_Color;
}

- (void)bezierPathPicture
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
	
	UIImageView *customImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
	customImageView.backgroundColor = [UIColor orangeColor];
	customImageView.image = img;
	[self.view addSubview:customImageView];
}

#pragma mark- Setter and getter
- (UIView *)textViewBgView
{
	if (!_textViewBgView) {
		_textViewBgView = [[UIView alloc] initWithFrame:CGRectMake(10, 120, 200, 70)];
		_textViewBgView.backgroundColor = WHITE_COLOR;
		
		UILabel *titLab = [UILabel autoLayoutLabel];
		titLab.textAlignment = NSTextAlignmentCenter;
		titLab.font = NFont(12);
		titLab.textColor = [UIColor orangeColor];
		titLab.text = @"textView限制输入字数";
		[_textViewBgView addSubview:titLab];
		
		[titLab mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(_textViewBgView);
			make.top.equalTo(_textViewBgView);
			make.size.mas_equalTo(CGSizeMake(200, 40));
		}];
		
		[_textViewBgView addSubview:self.tView];
	}
	return _textViewBgView;
}

- (UITextView *)tView
{
	if (!_tView) {
		_tView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, 200, 30)];
		_tView.layer.cornerRadius = 5;
		_tView.layer.borderWidth = 1;
		_tView.layer.borderColor = GRAY_COLOR.CGColor;
		_tView.delegate = self;
	}
	return _tView;
}

#pragma mark- Square area

@end
