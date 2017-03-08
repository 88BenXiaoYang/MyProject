//
//  BYScrollPagerView.h
//  Apps
//
//  Created by BianYong on 17/3/2.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYScrollPagerView : UIView

@property (nonatomic, assign) NSTimeInterval animationDuration; //default 0.2s. set animation time
@property (nonatomic, assign) NSInteger selectedTitleIndex;

- (void)setScrollPagerTitles:(NSArray *)titles contents:(NSArray *)contents;

@end
