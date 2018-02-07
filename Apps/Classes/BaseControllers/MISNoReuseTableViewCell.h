//
//  MISNoReuseTableViewCell.h
//  EDU
//
//  Created by Maokebing on 5/1/16.
//  Copyright © 2016 windtune. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface MISNoReuseTableViewCell : UITableViewCell
/**
 *  cell 高度
 */
@property (nonatomic, readonly) CGFloat height;

/**
 *  更新Cell
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj;


/**
 *  布局cell-子类实现
 *
 *  @param obj 指定obj
 *
 *  @return 布局后的高度
 */
- (CGFloat )layoutCellWithObj:(id )obj;

/**
 *  添加子view-子类实现
 */
- (void)prepare;

/**
 *  设置布局-子类实现
 */
- (void)placeSubViews;

/**
 *  是否是最后一行的 cell. 方便子类实现 set 方法，控制底部的线
 */
@property (nonatomic) BOOL isLastRowCell;


/**
 *  底部线条
 */
@property (nonatomic, strong, readonly) UIView* bottomLine;


@end
