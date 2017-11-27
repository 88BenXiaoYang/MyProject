//
//  CommonCarouselView.h
//  Apps
//
//  Created by by on 2017/11/26.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommonCarouselViewDelegate <NSObject>

@optional

@end

@interface CommonCarouselView : UIView

- (id)initWithFrame:(CGRect)frame delegate:(id<CommonCarouselViewDelegate>)delegate dataItems:(NSArray *)items isAuto:(BOOL)isAuto;

- (id)initWithFrame:(CGRect)frame delegate:(id<CommonCarouselViewDelegate>)delegate dataItems:(NSArray *)items;

- (void)scrollToIndex:(NSInteger)index;

@property (nonatomic, assign) id<CommonCarouselViewDelegate> delegate;

@end
