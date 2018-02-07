//
//  MISChooseAppComboPayTypeCell.h
//  CQJXT
//
//  Created by BianYong on 16/6/7.
//  Copyright © 2016年 Eduapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MISNoReuseTableViewCell.h"

@interface MISChooseAppComboPayTypeCell : MISNoReuseTableViewCell

/**
 *  当前选择的支付类型
 */
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic,   copy) void (^chooseAppComboPayTypeBlock)(void);

@end
