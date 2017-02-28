//
//  BYTableViewController.m
//  Apps
//
//  Created by BianYong on 17/2/28.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYTableViewController.h"

@interface BYTableViewController ()

@property (nonatomic) BOOL canLoadMore;
@property (nonatomic) BOOL canRefresh;
@property (nonatomic, readonly) BOOL isDragging;
@property (nonatomic, readonly) BOOL isRefreshing;
@property (nonatomic, readonly) BOOL isLoadingMore;
@property (nonatomic, strong) UIRefreshControl *refreshView;

@end

@implementation BYTableViewController

#pragma mark - Life Cycle

- (instancetype)init
{
	self = [super init];
	if (self) {
	}
	return self;
}

- (void)dealloc
{
	//Fix pop crash
	_table.delegate = nil;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	//添加TableView
	[self.view addSubview:self.table];
}

- (CGRect)tableRect {
	return CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate & UITableDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

#pragma mark - Pull Refersh Part
- (void)refresh {
	[self didStartRefresh];
	
	_isRefreshing = YES;
}

- (void)didStartRefresh{
	//Todo..
}

- (void)endRefresh {
	[self.refreshView endRefreshing];
	_isRefreshing = NO;
}

- (void)useRefresh {
	_canRefresh = YES;
	_isRefreshing = NO;
	
	if (self.refreshView.superview == nil) {
		[self.table insertSubview:self.refreshView atIndex:0];
	}
}

- (void)refreshCompleted {
	[self.refreshView removeFromSuperview];
	
	_canRefresh = NO;
	_isRefreshing = NO;
}

#pragma mark - LoadMore Part
- (void)loadMoreCompleted {
	_isLoadingMore = NO;
	_canLoadMore = NO;
	
	if (self.table.tableFooterView == self.loadFooterView) {
		self.table.tableFooterView = nil;
	}
}

- (void)useLoadMore {
	_canLoadMore = YES;
	_isLoadingMore = NO;
	
	if (self.table.tableFooterView == nil) {
		self.table.tableFooterView = self.loadFooterView;
	}
}

- (void)didStartLoadMore {
	//Todo..
}

- (void)loadMore {
	if (_isLoadingMore) {
		return;
	}
	
	_isLoadingMore = YES;
	
	[self didStartLoadMore];
}


- (void)endLoadMore {
	_isLoadingMore = NO;
}

- (CGFloat) footerLoadMoreHeight {
	return CGRectGetHeight(self.loadFooterView.frame);
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
	if (!self.isDragging && !self.isRefreshing && !self.isLoadingMore && self.canLoadMore) {
		CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
		if (scrollPosition < [self footerLoadMoreHeight]) {
			[self loadMore];
		}
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	if (_isRefreshing) {
		return;
	}
	
	_isDragging = NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	
}

#pragma mark - Getter & Setter
- (UIView *)headerView {
	return nil;
}

- (UIView *)footerView {
	return nil;
}

- (UIRefreshControl *)refreshView {
	if (_refreshView == nil)
	{
		_refreshView = [[UIRefreshControl alloc] init];
		[_refreshView addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
	}
	return _refreshView;
}

- (UIView *)loadFooterView {
	if (_loadFooterView == nil)
	{
		_loadFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44.0)];
		_loadFooterView.backgroundColor = [UIColor clearColor];
		
		//activity
		UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[activityIndicator startAnimating];
		
		//lable
		UILabel* label = [[UILabel alloc] init];
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont systemFontOfSize:14.0];
		label.text = @"正在加载...";
		[label sizeToFit];
		
		//frame
		label.center = CGPointMake(CGRectGetMidX(_loadFooterView.frame) + 5.0 + CGRectGetWidth(activityIndicator.frame) / 2.0, CGRectGetMidY(_loadFooterView.frame));
		activityIndicator.center = CGPointMake(CGRectGetMinX(label.frame) - 5.0 - CGRectGetWidth(activityIndicator.frame) / 2.0, CGRectGetMidY(_loadFooterView.frame));
		
		[_loadFooterView addSubview:activityIndicator];
		[_loadFooterView addSubview:label];
	}
	return _loadFooterView;
}

- (UITableView *)table {
	if (_table == nil) {
		_table = [[UITableView alloc] initWithFrame:self.tableRect style:UITableViewStyleGrouped];
		_table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		_table.dataSource = self;
		_table.delegate = self;
		_table.backgroundView = nil;
		_table.backgroundColor = CLEAR_COLOR;
		_table.rowHeight = 44.0;
		_table.tableFooterView = self.footerView;
		_table.tableHeaderView = self.headerView;
	}
	return _table;
}

@end
