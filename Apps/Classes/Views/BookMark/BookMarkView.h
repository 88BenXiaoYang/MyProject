//
//  BookMarkView.h
//  tmpProject
//
//  Created by bianyong on 2017/11/3.
//  Copyright © 2017年 bianyong. All rights reserved.
//  书签 = 书签头 + 书签内容
//  书签头：BookMarkTitleItemCell
//  书签内容：BookMarkContentItemCell

#import <UIKit/UIKit.h>
#import "BookMarkTitleItemCell.h"
#import "BookMarkContentItemCell.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width

@class BookMarkView;

@protocol BookMarkViewDelegate <NSObject>

@optional
- (CGSize)bookMarkView:(BookMarkView *_Nullable)bookMarkView itemSizeForIndexPath:(NSIndexPath *_Nonnull)indexPath;
- (void)bookMarkView:(BookMarkView *_Nullable)bookMarkView cellForIndexPath:(NSIndexPath *_Nonnull)indexPath configNormalStyleWithBookMarkTitleItemCell:(BookMarkTitleItemCell *_Nullable)bookMarkTitleItemCell;
- (void)bookMarkView:(BookMarkView *_Nullable)bookMarkView cellForIndexPath:(NSIndexPath *_Nonnull)indexPath configSelectedStyleWithBookMarkTitleItemCell:(BookMarkTitleItemCell *_Nullable)bookMarkTitleItemCell;

@end

@protocol BookMarkViewDataSource <NSObject>

@required
- (NSMutableArray *_Nullable)numberOfTitleItemsInBookMarkView:(BookMarkView *_Nonnull)bookMarkView;
- (NSMutableArray *_Nullable)numberOfContentItemsInBookMarkView:(BookMarkView *_Nonnull)bookMarkView;
- (void)bookMarkView:(BookMarkView *_Nonnull)bookMarkView cellForIndexPath:(NSIndexPath *_Nullable)indexPath configContentViewInBookMarkContentItemCell:(BookMarkContentItemCell *_Nullable)bookMarkContentItemCell; //config custom view for specific indexpath cell

@end

@interface BookMarkView : UIView

@property (nonatomic, weak, nullable) id <BookMarkViewDelegate> delegate;
@property (nonatomic, weak, nullable) id <BookMarkViewDataSource> dataSource;

@property (nonatomic, strong, nullable) UICollectionView *bookMarkTitleView;
@property (nonatomic, strong, nullable) UICollectionView *bookMarkContentView;

@property (nonatomic, assign) NSInteger presetCurrentIndex; //default is 0
@property (nonatomic, assign) NSInteger currentIndex; //current selected bookMarkTitleItemIndex
@property (nonatomic, strong, nullable) UIColor *sliderColor;
@property (nonatomic, assign) CGFloat titleViewBottomLineWidth; //需要根据titleItem count来设置width

- (void)reloadData;

@end
