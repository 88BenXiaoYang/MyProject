//
//  BYNavigationTitleViewController.m
//  Apps
//
//  Created by bianyong on 2017/11/8.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYNavigationTitleViewController.h"
#import "BYNavigationTitleView.h"

@interface BYNavigationTitleViewController ()

@property (nonatomic, strong) BYNavigationTitleView *navigationTitleView;

@end

@implementation BYNavigationTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationTitleView = [[BYNavigationTitleView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.navigationTitleView.backgroundColor = [UIColor blueColor];
    self.navigationItem.titleView = self.navigationTitleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
