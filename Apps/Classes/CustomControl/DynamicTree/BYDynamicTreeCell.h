//
//  BYDynamicTreeCell.h
//  Apps
//
//  Created by BianYong on 16/10/11.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYTableViewCell.h"
#import "BYDynamicTreeModel.h"

@interface BYDynamicTreeCell : BYTableViewCell

- (instancetype)initWithCellType:(BYDynamicTreeNodeType)nodeType;

- (void)setCellInfoWithModel:(BYDynamicTreeModel *)dataModel clickBlock:(void(^)(void))clickBlock;

@end
