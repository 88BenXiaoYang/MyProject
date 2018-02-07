//
//  MISNoReuseTableViewCell.m
//  EDU
//
//  Created by Maokebing on 5/1/16.
//  Copyright © 2016 windtune. All rights reserved.
//

#import "MISNoReuseTableViewCell.h"

@interface MISNoReuseTableViewCell()
@property (nonatomic, strong) UIView* bottomLine;
@end

@implementation MISNoReuseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self prepare];
		
		[self placeSubViews];
	}
	return self;
}

- (void)prepare {
	//for subclass
}

- (void)placeSubViews {
	//for subclass
}

/**
 *  子类实现-
 *
 *  @param isLastRowCell 最后一行
 */
- (void)setIsLastRowCell:(BOOL)isLastRowCell {
	
	//控制底线的显示与隐藏-子类可改写
	self.bottomLine.hidden = isLastRowCell;
	
	//For subclass
}


/**
 *  更新Cell
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj {
	_height = [self layoutCellWithObj:obj];
}

/**
 *  布局cell-子类实现
 *
 *  @param obj 指定obj
 *
 *  @return 布局后的高度
 */
- (CGFloat )layoutCellWithObj:(id )obj {
	return 0;
}

#pragma mark - Getter

- (UIView *)bottomLine {
	if (!_bottomLine) {
		_bottomLine = [UIView autoLayoutView];
		_bottomLine.backgroundColor = [UIColor lightGrayColor];
	}
	return _bottomLine;
}


@end
