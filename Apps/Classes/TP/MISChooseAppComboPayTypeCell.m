//
//  MISChooseAppComboPayTypeCell.m
//  CQJXT
//
//  Created by BianYong on 16/6/7.
//  Copyright © 2016年 Eduapp. All rights reserved.
//

#import "MISChooseAppComboPayTypeCell.h"

static const NSInteger chooseAppComboPayTypeCommonTag = 2222;

@interface MISChooseAppComboPayTypeCell ()

@property (nonatomic, strong) UIButton *titleBtn;

@end

@implementation MISChooseAppComboPayTypeCell

#pragma mark- Live circle
- (void)prepare
{
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	_currentIndex = -1;
}

- (void)placeSubViews
{
	[self.contentView addSubview:self.titleBtn];
	CGRect frame = self.titleBtn.frame;
	[_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView);
		make.top.equalTo(self.contentView).offset(5);
		make.width.equalTo(@(frame.size.width));
		make.height.equalTo(@(frame.size.height));
	}];
	
	[self.contentView addSubview:self.bottomLine];
	[self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView);
		make.right.equalTo(self.contentView);
		make.bottom.equalTo(self.contentView);
		make.height.equalTo(@(MIS_ONE_PX));
	}];
}

- (CGFloat)layoutCellWithObj:(id)obj
{
	NSArray *payTypeArray = obj;
		
	NSInteger count = payTypeArray.count;
	
	CGFloat marginH = 15.0f;
	CGFloat marginV = 15.0f;
	CGFloat pointY = 5.0f;
	CGFloat pointX = marginH;
	
	// title part
	CGRect frame = self.titleBtn.frame;
	
	pointY += CGRectGetHeight(frame);
	pointY += marginV;
	
	if (count == 0) {
		return pointY;
	}
	
	// btn layout
	CGFloat btnW = (SCREEN_WIDTH - marginH * 3) / 2.0f;
	CGFloat btnH = 30.0f;
	
	for (NSInteger i = 0; i < count; i++) {
		UIButton *btn = [self createComboPayItem];
		btn.frame = CGRectMake(pointX, pointY, btnW, btnH);
		btn.tag = chooseAppComboPayTypeCommonTag + i;
		btn.selected = self.currentIndex == i;
		[self.contentView addSubview:btn];
		
		pointX += btnW;
		pointX += marginH;
		
		if ((i + 1) % 2 == 0) {
			pointX = marginH;
			pointY += marginV;
			pointY += btnH;
		}
		
		if ((i == count - 1) && (count % 2 != 0)) {
			pointY += marginV;
			pointY += btnH;
		}
		
		//数据
		NSDictionary *dict = [payTypeArray objectAtIndex:i];
		[btn setTitle:dict[@"title"] forState:UIControlStateNormal];
		[btn setImage:IMAGE_WITH_NAME(dict[@"icon"]) forState:UIControlStateNormal];
		btn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
		btn.titleEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(btn.imageView.bounds) + 10, 0, 0);
		btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
	}
	
	return pointY;
}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods

#pragma mark- Event Response methods
- (void)changePayType:(UIButton *)sender
{
	NSInteger index = sender.tag - chooseAppComboPayTypeCommonTag;
	self.currentIndex = index;
	
	if (_chooseAppComboPayTypeBlock != nil) {
		_chooseAppComboPayTypeBlock();
	}
}

#pragma mark- Private methods
- (UIButton *)createComboPayItem
{
	UIButton *btnComboItem = [UIButton buttonWithType:UIButtonTypeCustom];
	btnComboItem.layer.cornerRadius = 5;
	btnComboItem.titleLabel.font = NFont(13);
	[btnComboItem setTitleColor:GRAY_COLOR forState:UIControlStateNormal];
	[btnComboItem setTitleColor:Parent_Common_Color forState:UIControlStateSelected];
//    [btnComboItem setBackgroundImage:[Utils tileImage:@"mis_choose_combo_btn_normal"] forState:UIControlStateNormal];
	[btnComboItem setBackgroundImage:IMAGE_WITH_NAME(@"mis_choose_combo_btn_selected") forState:UIControlStateSelected];
	[btnComboItem addTarget:self action:@selector(changePayType:) forControlEvents:UIControlEventTouchUpInside];
	
	return btnComboItem;
}

#pragma mark- Setter and getter
- (UIButton *)titleBtn
{
	if (_titleBtn == nil) {
		_titleBtn = [UIButton autoLayoutButton];
		_titleBtn.userInteractionEnabled = NO;
		[_titleBtn setTitle:@"选择支付方式" forState:UIControlStateNormal];
        _titleBtn.titleLabel.font = NFont(14);
		//背景图平铺
//        [_titleBtn setBackgroundImage:[Utils tileImage:@"mis_choose_combo_pay_type"] forState:UIControlStateNormal];
		
		//内容边距设置
		_titleBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
		
		[_titleBtn sizeToFit];
	}
	return _titleBtn;
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
	if (_currentIndex != currentIndex) {
		if (_currentIndex != -1) {
			UIButton *btn = [self.contentView viewWithTag:chooseAppComboPayTypeCommonTag + _currentIndex];
			btn.selected = NO;
		}
		
		_currentIndex = currentIndex;
		UIButton *btn = [self.contentView viewWithTag:chooseAppComboPayTypeCommonTag + currentIndex];
		btn.selected = YES;
	}
}

#pragma mark- Square area

@end
