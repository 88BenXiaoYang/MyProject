//
//  BYADDetailViewController.m
//  Apps
//
//  Created by by on 2017/11/19.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYADDetailViewController.h"
#import "CommonCarouselView.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@interface BYADDetailViewController () <CommonCarouselViewDelegate>

@property (nonatomic, strong) CommonCarouselView *adView;
@property (nonatomic, strong) SGFocusImageFrame *adViewB;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation BYADDetailViewController
#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepare];
    [self placeSubViews];
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
- (void)prepare
{
//    self.dataArray = @[[UIColor purpleColor], [UIColor orangeColor], [UIColor blueColor], [UIColor purpleColor], [UIColor orangeColor]];
}

- (void)placeSubViews
{
    /*
    self.adView = [[CommonCarouselView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 100) delegate:self dataItems:_dataArray isAuto:YES];
    [self.view addSubview:_adView];
     */
    
    [self buildData];
}

- (void)buildData
{
    NSArray *colorArray = @[[UIColor orangeColor], [UIColor purpleColor], [UIColor blueColor]];
    //添加最后一张图 用于循环
    //    int length = 4;
    NSInteger length = [colorArray count];
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < length; i++)
    {
        UIColor *color = [colorArray objectAtIndex:i];
        NSDictionary *dataDic = [NSDictionary dictionaryWithObject:color forKey:@"color"];
        [tempArray addObject:dataDic];
    }
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:length+2];
    if (length > 1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:length-1];
        SGFocusImageItem *imagItem = [[SGFocusImageItem alloc] initWithDict:dict tag:-1];
        [itemArray addObject:imagItem];
    }
    for (int i = 0; i < length; i++)
    {
        NSDictionary *dict = [tempArray objectAtIndex:i];
        SGFocusImageItem *imagItem = [[SGFocusImageItem alloc] initWithDict:dict tag:i];
        [itemArray addObject:imagItem];
        
    }
    //添加第一张图 用于循环
    if (length >1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:0];
        SGFocusImageItem *imagItem = [[SGFocusImageItem alloc] initWithDict:dict tag:length];
        [itemArray addObject:imagItem];
    }
    SGFocusImageFrame *bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 150, 320,  200) delegate:nil imageItems:itemArray isAuto:YES];
    [bannerView scrollToIndex:1];
    [self.view addSubview:bannerView];
}

#pragma mark- Setter and getter

@end
