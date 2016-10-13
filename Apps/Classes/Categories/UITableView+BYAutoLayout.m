//
//  UITableView+BYAutoLayout.m
//  Apps
//
//  Created by BianYong on 16/10/10.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UITableView+BYAutoLayout.h"

@implementation UITableView (BYAutoLayout)

+ (UITableView *)autoLayoutGroupedTableView {
	UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	return tableView;
}

+ (UITableView *)autoLayoutPlainTableView {
	UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	return tableView;
}

@end
