//
//  BYViewController.h
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYViewController : UIViewController

//支持滑动返回
- (BOOL)canDragBack;

//左健
- (UIBarButtonItem *)leftBarButtonItem;

//右健
- (UIBarButtonItem *)rightBarButtonItem;

//返回
- (void)goBack;

@end
