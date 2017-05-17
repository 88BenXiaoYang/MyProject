//
//  BYLoadLocalDBDataViewController.m
//  Apps
//
//  Created by BianYong on 17/5/17.
//  Copyright © 2017年 BY. All rights reserved.
//
//  用SQLite API操作数据库数据

#import "BYLoadLocalDBDataViewController.h"
#import "Food.h"
#import <sqlite3.h>

@interface BYLoadLocalDBDataViewController ()

@property (nonatomic, strong) UITextView *contentV;

@property (nonatomic,   copy) NSString *databaseName;
@property (nonatomic,   copy) NSString *databasePath;
@property (nonatomic, strong) NSMutableArray *foods;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic,   copy) NSMutableString *dataContentStr;

@end

@implementation BYLoadLocalDBDataViewController

#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initSetting];
	[self layoutLoadLocalDBDataView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"LoadLocalDBData";
	self.view.backgroundColor = BG_Color;
	
	[self loadLocalDBData];
	[self buildData];
}

- (void)layoutLoadLocalDBDataView
{
	[self.view addSubview:self.contentV];
}

- (void)loadLocalDBData
{
	self.databaseName = @"foods.db";
	
	//这是指定Documents下的路径
	//	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	//	NSString *documentDir = [documentPaths objectAtIndex:0];
	//	self.databasePath = [documentDir stringByAppendingPathComponent:self.databaseName];
	
	self.databasePath = [[NSBundle mainBundle] pathForResource:@"foods.db" ofType:nil];
	
	//	[self checkAndCreateDatabase];
	
	[self readFoodsFromDatabase];
}

- (void)checkAndCreateDatabase
{
	
}

- (void)readFoodsFromDatabase
{
	//建立数据库对象
	sqlite3 *database;
	
	//打开数据库
	//API:
	//sqlite3_open([self.databasePath UTF8String], &database)
	//sqlite3_open_v2([self.databasePath UTF8String], &database, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL)
	int openSqliteStatus = sqlite3_open([self.databasePath UTF8String], &database);
	if (openSqliteStatus == SQLITE_OK) {
		//建立SQL语句
		const char *sqlStatement = "select * from foods";
		
		sqlite3_stmt *compiledStatement;
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			//循环遍历结果，并将结果添加到数组foods中
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				//从结果行读取数据
//				int foodsID = sqlite3_column_int(compiledStatement, 0);
//				NSString *idStr = [NSString stringWithFormat:@"%d",foodsID];
				
				NSString *aFreq = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSString *aPop = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				
				Food *food = [[Food alloc] initWithName:aName first:aFreq popularity:aPop];
				[self.foods addObject:food];
				
				//dataList
				NSString *dataStr = [NSString stringWithFormat:@"id : %@, type_id : %@, name : %@\n", aFreq, aPop, aName];
				[self.dataList addObject:dataStr];
			}
		}
		//结束语句
		sqlite3_finalize(compiledStatement);
	}
	//关闭数据库
	sqlite3_close(database);
	
	NSLog(@"foods number : %lu :\n des : %@", (unsigned long)self.foods.count, self.foods);
}

- (void)buildData
{
	for (NSString *tpStr in self.dataList) {
		self.dataContentStr = [[self.dataContentStr stringByAppendingString:tpStr] mutableCopy];
	}
}

#pragma mark- Setter and getter
- (UITextView *)contentV
{
	if (!_contentV) {
		_contentV = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
		_contentV.backgroundColor = CLEAR_COLOR;
		_contentV.textColor = BLACK_COLOR;
		_contentV.text = self.dataContentStr;
	}
	return _contentV;
}

- (NSMutableArray *)foods
{
	if (!_foods) {
		_foods = [NSMutableArray array];
	}
	return _foods;
}

- (NSMutableArray *)dataList
{
	if (!_dataList) {
		_dataList = [NSMutableArray array];
	}
	return _dataList;
}

- (NSMutableString *)dataContentStr
{
	if (!_dataContentStr) {
		_dataContentStr = [NSMutableString string];
	}
	return _dataContentStr;
}

#pragma mark- Square area

@end
