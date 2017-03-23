//
//  BYBViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYBViewController.h"

@interface BYBViewController () <UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>

//tableView
@property (strong, nonatomic)  UITableView *tableView;

//searchController
@property (strong, nonatomic)  UISearchController *searchController;

//数据源
@property (strong,nonatomic) NSMutableArray  *dataList;

@property (strong,nonatomic) NSMutableArray  *searchList;

@end

@implementation BYBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"BView";
	
//	self.navigationController.navigationBar.translucent = YES;
//	self.navigationController.navigationBar.translucent = NO;
	
	_dataList = [NSMutableArray array];
	_searchList = [NSMutableArray array];
	
	self.dataList=[NSMutableArray arrayWithCapacity:100];
	
	//产生100个“数字+三个随机字母”
	for (NSInteger i=0; i<100; i++) {
		[self.dataList addObject:[NSString stringWithFormat:@"%ld%@",(long)i,[self shuffledAlphabet]]];
	}
	
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, SCREEN_HEIGHT)];
	
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	
	//创建UISearchController
	_searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
	//设置代理
	_searchController.delegate = self;
	_searchController.searchResultsUpdater= self;
	
	//设置UISearchController的显示属性，以下3个属性默认为YES
	//搜索时，背景变暗色
	_searchController.dimsBackgroundDuringPresentation = NO;
	//搜索时，背景变模糊
//	_searchController.obscuresBackgroundDuringPresentation = NO;
	//隐藏导航栏
//	_searchController.hidesNavigationBarDuringPresentation = NO;
	
//	_searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
	
	// 添加 searchbar 到 headerview
	self.tableView.tableHeaderView = _searchController.searchBar;
	
	[self.view addSubview:_tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
//	[self testBugly];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testBugly
{
	MISLogFunc;
	NSString *str = @"ddddd";
	MISLog(@"%@", str);
	str = nil;
	
	if (str.length > 0) {
		MISLog(@"%@", str);
	}
	
	NSArray *array = [NSArray arrayWithObjects:@"0", @"1", @"2", nil];
	for (NSString *st in array) {
		MISLog(@"%@", st);
	}
	
	MISLog(@"%@", [array objectAtIndex:100]);
}

//产生3个随机字母
- (NSString *)shuffledAlphabet {
	
	NSMutableArray * shuffledAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
	
	NSString *strTest = [[NSString alloc]init];
	for (int i=0; i<3; i++) {
		int x = arc4random() % 25;
		strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffledAlphabet[x]];
	}
	
	return strTest;
	
}

//设置区域的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (self.searchController.active) {
		return [self.searchList count];
	}else{
		return [self.dataList count];
	}
}


//返回单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *flag=@"cell";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
	if (cell==nil) {
		cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
	}
	if (self.searchController.active) {
		if (self.searchList.count > 0) {
			[cell.textLabel setText:self.searchList[indexPath.row]];
		}
	}
	else{
		[cell.textLabel setText:self.dataList[indexPath.row]];
	}
	return cell;
}


#pragma mark - UISearchControllerDelegate代理

//测试UISearchController的执行过程
- (void)willPresentSearchController:(UISearchController *)searchController
{
	NSLog(@"willPresentSearchController");
//	self.navigationController.navigationBar.translucent = YES;
}

- (void)didPresentSearchController:(UISearchController *)searchController
{
	NSLog(@"didPresentSearchController");
	CGRect frame = self.tableView.frame;
	frame.origin.y = 20;
	self.tableView.frame = frame;
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
	NSLog(@"willDismissSearchController");
	
	CGRect frame = self.tableView.frame;
	frame.origin.y = 0;
	self.tableView.frame = frame;
	
//	self.navigationController.navigationBar.translucent = NO;
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
	NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController
{
	NSLog(@"presentSearchController");
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
	
//	self.edgesForExtendedLayout = UIRectEdgeNone;
	
	NSLog(@"updateSearchResultsForSearchController");
	NSString *searchString = [self.searchController.searchBar text];
	NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
	if (self.searchList!= nil && searchString.length > 0) {
		[self.searchList removeAllObjects];
		//过滤数据
		self.searchList= [NSMutableArray arrayWithArray:[_dataList filteredArrayUsingPredicate:preicate]];
		//刷新表格
		[self.tableView reloadData];
	}
}

@end
