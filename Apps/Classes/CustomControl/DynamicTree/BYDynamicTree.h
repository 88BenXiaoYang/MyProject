//
//  BYDynamicTree.h
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//
//  TableView的树形结构
//  支持：展开、折叠，单选、多选

#import <UIKit/UIKit.h>

@interface BYDynamicTree : UIView

- (instancetype)initWithFrame:(CGRect)frame treeData:(NSMutableArray *)treeArray;

@end
