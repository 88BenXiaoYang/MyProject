//
//  BYTableViewCell.h
//  Apps
//
//  Created by BianYong on 16/10/11.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYTableViewCell : UITableViewCell

/**
 *  复用标识
 *
 *  @return NSString obj
 */
+ (NSString *)reuseIdentifier;

/**
 *  更新Cell-子类实现
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj;

/**
 *  获取高度-子类实现
 *
 *  @param obj 指定obj
 *
 *  @return 高度
 */
+ (CGFloat )heightForCellWithObj:(id )obj;

/**
 *  添加子view-子类实现
 */
- (void)prepare;

/**
 *  设置布局-子类实现
 */
- (void)placeSubViews;

@end
