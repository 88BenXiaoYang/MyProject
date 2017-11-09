//
//  BYNavigationTitleView.h
//  Apps
//
//  Created by bianyong on 2017/11/8.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYNavigationTitleView : UIView

@property (nonatomic,   copy) void(^navigationTitleViewBlock)(void);

@end
