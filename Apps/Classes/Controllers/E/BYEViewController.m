//
//  BYEViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYEViewController.h"
#import "BYSectionTypeACell.h"
#import "BYSectionTypeCCell.h"
#import "BYSectionTypeDCell.h"

typedef NS_ENUM(NSInteger, HomeSectionType) {
    HomeSectionTypeA = 100,
    HomeSectionTypeB,
    HomeSectionTypeC,
    HomeSectionTypeD,
    HomeSectionTypeE,
    HomeSectionTypeF
};

static NSString *cellAIdentifier = @"cellAIdentifier";
static NSString *cellBIdentifier = @"cellBIdentifier";
static NSString *cellCIdentifier = @"cellCIdentifier";

@interface BYEViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *customActivityImageView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sectionData;

@end

@implementation BYEViewController
#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EView";
//    [self.view addSubview:self.customActivityImageView];
//    [self animationA];
    
    [self buildSectionData];
    [self prepare];
    [self placeSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark- Overwrite
#pragma mark- Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *itemDic = [self.sectionData objectAtIndex:indexPath.section];
    
    NSInteger sectionType = [itemDic[@"sectionType"] integerValue];
    
    switch (sectionType) {
        case HomeSectionTypeA:
            {
                BYSectionTypeACell *cell = [tableView dequeueReusableCellWithIdentifier:cellAIdentifier];
                cell.backgroundColor = [UIColor purpleColor];
                return cell;
            }
            break;
        case HomeSectionTypeB:
            {
                BYSectionTypeCCell *cell = [tableView dequeueReusableCellWithIdentifier:cellCIdentifier];
                cell.backgroundColor = [UIColor orangeColor];
                return cell;
            }
            break;
        case HomeSectionTypeC:
            {
                BYSectionTypeDCell *cell = [tableView dequeueReusableCellWithIdentifier:cellCIdentifier];
                cell.backgroundColor = [UIColor redColor];
                return cell;
            }
            break;
        case HomeSectionTypeD:
            {
//                cell = [[BYSectionTypeACell alloc] init];
//                cell.backgroundColor = [UIColor greenColor];
            }
            break;
        case HomeSectionTypeE:
            {
//                cell = [[BYSectionTypeCCell alloc] init];
//                cell.backgroundColor = [UIColor yellowColor];
            }
            break;
        case HomeSectionTypeF:
            {
//                cell = [[BYSectionTypeDCell alloc] init];
//                cell.backgroundColor = [UIColor blueColor];
            }
            break;
            
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    sectionHeaderV.backgroundColor = WHITE_COLOR;
    
    return sectionHeaderV;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *sectionFooterV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    sectionFooterV.backgroundColor = WHITE_COLOR;
    
    return sectionFooterV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == (_sectionData.count - 1)) {
        return 20;
    }
    return 10;
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
}

- (void)placeSubViews
{
    [self.view addSubview:self.tableView];
}

- (void)buildSectionData
{
    [self.sectionData removeAllObjects];
    
    NSMutableDictionary *itemDic = [NSMutableDictionary dictionary];
    itemDic[@"sectionType"] = @(HomeSectionTypeA);
    [self.sectionData addObject:itemDic];
    
    itemDic = [NSMutableDictionary dictionary];
    itemDic[@"sectionType"] = @(HomeSectionTypeB);
    [self.sectionData addObject:itemDic];
    
    itemDic = [NSMutableDictionary dictionary];
    itemDic[@"sectionType"] = @(HomeSectionTypeC);
    [self.sectionData addObject:itemDic];
    
//    itemDic = [NSMutableDictionary dictionary];
//    itemDic[@"sectionType"] = @(HomeSectionTypeD);
//    [self.sectionData addObject:itemDic];
//
//    itemDic = [NSMutableDictionary dictionary];
//    itemDic[@"sectionType"] = @(HomeSectionTypeE);
//    [self.sectionData addObject:itemDic];
//
//    itemDic = [NSMutableDictionary dictionary];
//    itemDic[@"sectionType"] = @(HomeSectionTypeF);
//    [self.sectionData addObject:itemDic];
}

- (void)animationA
{
    [UIView animateWithDuration:0.03 animations:^{
        CGFloat degree = 0.04f * M_PI;
        self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             CGFloat degree = 0.04f * M_PI;
                             self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
                             [self animationA];
                         }
                     }];
}

- (void)animationB
{
    [UIView beginAnimations:@"animationID" context:NULL];
    [UIView setAnimationDuration:0.1];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:5];
    CGFloat degree = 0.04f * M_PI;
    self.customActivityImageView.transform = CGAffineTransformRotate(self.customActivityImageView.transform, degree);
    [UIView commitAnimations];
}

#pragma mark- Setter and getter
- (UIImageView *)customActivityImageView
{
    if (!_customActivityImageView) {
        _customActivityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
        _customActivityImageView.backgroundColor = [UIColor clearColor];
        _customActivityImageView.image = Image_With_Name(@"refresh_round_arrow");
    }
    return _customActivityImageView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = BG_Color;
        
        [_tableView registerClass:[BYSectionTypeACell class] forCellReuseIdentifier:cellAIdentifier];
        [_tableView registerClass:[BYSectionTypeCCell class] forCellReuseIdentifier:cellBIdentifier];
        [_tableView registerClass:[BYSectionTypeDCell class] forCellReuseIdentifier:cellCIdentifier];
    }
    return _tableView;
}

- (NSMutableArray *)sectionData
{
    if (!_sectionData) {
        _sectionData = [NSMutableArray array];
    }
    return _sectionData;
}
#pragma mark- Square area

@end
