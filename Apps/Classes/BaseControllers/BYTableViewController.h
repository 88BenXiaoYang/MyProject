//
//  BYTableViewController.h
//  Apps
//
//  Created by BianYong on 17/2/28.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYViewController.h"

@interface BYTableViewController : BYViewController <UITableViewDelegate, UITableViewDataSource>

/*
 * table for controller. default is a grouped table.
 * for sub class  overwrite getter to custom a new one.
 */
@property (nonatomic, strong) UITableView *table;

/*
 * headerView for controller or table. default is nil.
 * for sub class  overwrite getter to custom a new one.
 */
@property (nonatomic, strong) UIView *headerView;

/*
 * footerView for controller or table. default is nil.
 * for sub class  overwrite getter to custom a new one.
 */
@property (nonatomic, strong) UIView *footerView;


@property (nonatomic, strong) UIView *loadFooterView;

/*
 *table rect for table
 */
- (CGRect)tableRect;

/*
 *for sub class  overwrite
 *will be toggled when pull up
 */
- (void)didStartLoadMore;

/*
 *for sub class  overwrite
 *will be toggled when pull down
 */
- (void)didStartRefresh;

/*
 *use load more footer
 */
- (void)useLoadMore;

/*
 *use pull refresh
 */
- (void)useRefresh;

/*
 *end load more
 */
- (void)endLoadMore;

/*
 *load more completed
 */
- (void)loadMoreCompleted;

/*
 *end refresh
 */
- (void)endRefresh;

/*
 *reresh completed
 */
- (void)refreshCompleted;

@end
