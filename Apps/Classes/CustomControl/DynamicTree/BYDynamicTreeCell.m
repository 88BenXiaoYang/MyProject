//
//  BYDynamicTreeCell.m
//  Apps
//
//  Created by BianYong on 16/10/11.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYDynamicTreeCell.h"

#define kChooseImageWidth    25

@interface BYDynamicTreeCell ()

@property (nonatomic, strong) UIImageView *chooseImage;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *arrowBtn;
@property (nonatomic,   copy) void (^arrowBtnClickBlock)(void);

@property (nonatomic, assign) BYDynamicTreeNodeType nodeType;

@end

@implementation BYDynamicTreeCell

#pragma mark- Live circle
- (instancetype)initWithCellType:(BYDynamicTreeNodeType)nodeType
{
	if (self = [super init]) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self layoutCellWithCellType:nodeType];
	}
	return self;
}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
- (void)setCellInfoWithModel:(BYDynamicTreeModel *)dataModel clickBlock:(void (^)(void))clickBlock
{
	_titleLab.text = dataModel.title;
	_chooseImage.image = dataModel.isSelect ? Image_With_Name(@"MISSendNotifiSelectCkecked") : Image_With_Name(@"MISSendNotifiSelectUnckeck");
	
	self.arrowBtnClickBlock = clickBlock;
}

#pragma mark- Event Response methods
- (void)arrowBtnClicked:(UIButton *)sender
{
	if (_arrowBtnClickBlock) {
		_arrowBtnClickBlock();
	}
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)layoutCellWithCellType:(BYDynamicTreeNodeType)nodeType
{
	[self.contentView addSubview:self.chooseImage];
	[self.contentView addSubview:self.titleLab];
	[self.contentView addSubview:self.arrowBtn];
	
	switch (nodeType) {
		case BYDynamicTreeNodeTypeAllGroup:
		{
			[self layoutWithAllGroup];
		}
			break;
			
		case BYDynamicTreeNodeTypeAllTeam:
		{
			[self layoutWithAllTeam];
		}
			break;
			
		case BYDynamicTreeNodeTypeGroup:
		{
			[self layoutWithGroup];
		}
			break;
			
		case BYDynamicTreeNodeTypeTeam:
		{
			[self layoutWithTeam];
		}
			break;
			
		case BYDynamicTreeNodeTypeMember:
		{
			[self layoutWithMember];
		}
			break;
	}
}

- (void)layoutWithAllGroup
{
	
}

- (void)layoutWithAllTeam
{
	
}

- (void)layoutWithGroup
{
	
}

- (void)layoutWithTeam
{
	[_chooseImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self).offset(10);
		make.centerY.equalTo(self);
		make.width.mas_equalTo(kChooseImageWidth);
		make.height.mas_equalTo(kChooseImageWidth);
	}];
	
	[_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(_chooseImage.mas_right).offset(10);
		make.top.equalTo(self);
		make.right.equalTo(_arrowBtn.mas_left).offset(-10);
		make.bottom.equalTo(self);
	}];
	
	[_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(self).offset(-10);
		make.top.equalTo(self);
		make.width.mas_equalTo(50);
		make.bottom.equalTo(self);
	}];
}

- (void)layoutWithMember
{
	[_chooseImage mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self).offset(30);
		make.centerY.equalTo(self);
		make.width.mas_equalTo(kChooseImageWidth);
		make.height.mas_equalTo(kChooseImageWidth);
	}];
	
	[_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(_chooseImage.mas_right).offset(10);
		make.top.equalTo(self);
		make.right.equalTo(_arrowBtn.mas_left).offset(-10);
		make.bottom.equalTo(self);
	}];
	
	[_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(self).offset(-10);
		make.top.equalTo(self);
		make.width.mas_equalTo(50);
		make.bottom.equalTo(self);
	}];
}

#pragma mark- Setter and getter
- (UILabel *)titleLab
{
	if (!_titleLab) {
		_titleLab = [UILabel autoLayoutLabel];
		_titleLab.backgroundColor = [UIColor purpleColor];
	}
	return _titleLab;
}

- (UIButton *)arrowBtn
{
	if (!_arrowBtn) {
		_arrowBtn = [UIButton autoLayoutButton];
		_arrowBtn.backgroundColor = [UIColor orangeColor];
		[_arrowBtn addTarget:self action:@selector(arrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _arrowBtn;
}

- (UIImageView *)chooseImage
{
	if (!_chooseImage) {
		_chooseImage = [UIImageView autoLayoutImageView];
		[_chooseImage sizeToFit];
	}
	return _chooseImage;
}

#pragma mark- Square area

@end
