//
//  BYBViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYBViewController.h"

@interface BYBViewController ()

@end

@implementation BYBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"BView";
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

@end
