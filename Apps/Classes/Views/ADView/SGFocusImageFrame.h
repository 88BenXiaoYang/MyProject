//
//  SGFocusImageFrame.h
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGFocusImageItem;
@class SGFocusImageFrame;

#pragma mark - SGFocusImageFrameDelegate
@protocol SGFocusImageFrameDelegate <NSObject>
@optional
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item;
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item currentItem:(int)index;
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame currentItem:(NSInteger)index;

@end


@interface SGFocusImageFrame : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate>
{
    BOOL _isAutoPlay;
}
- (id)initWithFrame:(CGRect)frame delegate:(id<SGFocusImageFrameDelegate>)delegate imageItems:(NSArray *)items isAuto:(BOOL)isAuto;

- (id)initWithFrame:(CGRect)frame delegate:(id<SGFocusImageFrameDelegate>)delegate focusImageItems:(SGFocusImageItem *)items, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithFrame:(CGRect)frame delegate:(id<SGFocusImageFrameDelegate>)delegate imageItems:(NSArray *)items;
- (void)scrollToIndex:(NSInteger)aIndex;          //控制pageController的初始位置

@property (nonatomic, assign) id<SGFocusImageFrameDelegate> delegate;

//***定时器
@property (nonatomic, retain) NSTimer *timer;

@end
