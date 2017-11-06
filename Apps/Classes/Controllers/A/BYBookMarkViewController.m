//
//  BYBookMarkViewController.m
//  Apps
//
//  Created by bianyong on 2017/11/6.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYBookMarkViewController.h"
#import "BookMarkView.h"

@interface BYBookMarkViewController () <BookMarkViewDelegate, BookMarkViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *contentArray;

@property (nonatomic, strong) BookMarkView *bookMarkView;

@end

@implementation BYBookMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepare];
    [self placeSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepare
{
    self.titleArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"];
    
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIView *tmpV = [[UIView alloc] init];
        tmpV.backgroundColor = [UIColor whiteColor];
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 40)];
        contentLab.text = [NSString stringWithFormat:@"page_content : %zd", i];
        contentLab.textColor = [UIColor redColor];
        contentLab.textAlignment = NSTextAlignmentCenter;
        [tmpV addSubview:contentLab];
        [self.contentArray addObject:tmpV];
    }
}

- (void)placeSubView
{
    self.bookMarkView = [[BookMarkView alloc] init];
    self.bookMarkView.delegate = self;
    self.bookMarkView.dataSource = self;
    
    //note mini_height:50 !!!
    self.bookMarkView.bookMarkTitleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    [self.view addSubview:self.bookMarkView.bookMarkTitleView];
    
    self.bookMarkView.bookMarkContentView.frame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT - 50);
    [self.view addSubview:self.bookMarkView.bookMarkContentView];
    
    [self.bookMarkView reloadData];
}

- (NSMutableArray *)contentArray
{
    if (!_contentArray) {
        _contentArray = [NSMutableArray array];
    }
    return _contentArray;
}

#pragma mark- delegate
- (NSMutableArray *)numberOfTitleItemsInBookMarkView:(BookMarkView *)bookMarkView
{
    return [self.titleArray mutableCopy];
}

- (NSMutableArray *)numberOfContentItemsInBookMarkView:(BookMarkView *)bookMarkView
{
    return self.contentArray;
}

- (void)bookMarkView:(BookMarkView *)bookMarkView cellForIndexPath:(NSIndexPath *)indexPath configContentViewInBookMarkContentItemCell:(BookMarkContentItemCell *)bookMarkContentItemCell
{
    UIView *tpView = [self.contentArray objectAtIndex:indexPath.row];
    bookMarkContentItemCell.customContentView = tpView;
}

- (CGSize)bookMarkView:(BookMarkView *)bookMarkView itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 40);
}

@end
