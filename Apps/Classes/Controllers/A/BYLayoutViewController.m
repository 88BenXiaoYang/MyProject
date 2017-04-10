//
//  BYLayoutViewController.m
//  Apps
//
//  Created by BianYong on 17/2/28.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYLayoutViewController.h"
#import "UIKit+AFNetworking.h"

@interface BYLayoutViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *gifBgView;
@property (nonatomic, strong) UIImageView *gifImageView;

@end

@implementation BYLayoutViewController
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
}

-(void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];
	
	[self layoutButtonElements];
	[self loadGifImage];
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
- (void)initSetting
{
	self.title = @"控件元素布局";
	self.view.backgroundColor = BG_Color;
}

- (void)layoutButtonElements
{
	[self.view addSubview:self.btn];
	_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
	_btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
	NSString *btnTitStr = _btn.currentTitle;
	UIImage *btnImg = _btn.currentImage;
	CGSize btnTitleSize = [btnTitStr mis_sizeWithFont:NFont(14) constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
	btnTitleSize.width += 24;
	CGSize btnImgSize = btnImg.size;
	CGSize btnSize = _btn.frame.size;
	CGFloat marginV = 5;
	_btn.titleLabel.backgroundColor = [UIColor orangeColor];
	[_btn setTitleEdgeInsets:UIEdgeInsetsMake(btnImgSize.height + marginV*2, ((btnSize.width - btnTitleSize.width)/2 - btnImgSize.width), 0, 0)];
	[_btn setImageEdgeInsets:UIEdgeInsetsMake(marginV, (btnSize.width - btnImgSize.width)/2, 0, 0)];
}

- (void)loadGifImage
{
	[self.view addSubview:self.gifBgView];
	NSURL *gifUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1483511554654&di=94a4d5e47b0a2c3e43246aca113a2646&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01686256fe374032f875a9449ee89e.gif"];
//	NSURL *imgUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1483516950271&di=87c6cd414786503e53314f60f6507cb7&imgtype=0&src=http%3A%2F%2Fsc.jb51.net%2Fuploads%2Fallimg%2F150629%2F10-15062Z9524NO.jpg"];
	
	[_gifImageView setImageWithURL:gifUrl placeholderImage:[UIImage imageNamed:@"twitterIcon"]];
}

#pragma mark- Setter and getter
- (UIButton *)btn
{
	if (!_btn) {
		_btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 220, 80)];
		_btn.backgroundColor = [UIColor whiteColor];
		[_btn setTitle:@"按钮元素布局" forState:UIControlStateNormal];
		[_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_btn setImage:[UIImage imageNamed:@"tickblue"] forState:UIControlStateNormal];
	}
	return _btn;
}

- (UIView *)gifBgView
{
	if (!_gifBgView) {
		_gifBgView = [[UIView alloc] initWithFrame:CGRectMake(10, 110, 150, 190)];
		_gifBgView.backgroundColor = WHITE_COLOR;
		
		UILabel *tit = [UILabel autoLayoutLabel];
		tit.font = NFont(10);
		tit.textAlignment = NSTextAlignmentCenter;
		tit.textColor = [UIColor orangeColor];
		tit.text = @"AFN框架下加载GIF图片";
		[_gifBgView addSubview:tit];
		
		[tit mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(_gifBgView);
			make.top.equalTo(_gifBgView);
			make.size.mas_equalTo(CGSizeMake(150, 40));
		}];
		
		[_gifBgView addSubview:self.gifImageView];
	}
	return _gifBgView;
}

- (UIImageView *)gifImageView
{
	if (!_gifImageView) {
		_gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 150, 150)];
	}
	return _gifImageView;
}

#pragma mark- Square area

@end
