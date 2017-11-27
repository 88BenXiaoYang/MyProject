//
//  CommonCarouselView.m
//  Apps
//
//  Created by by on 2017/11/26.
//  Copyright © 2017年 BY. All rights reserved.
//
//  CommonCarousel 原理：3-1-2-3-1，因此会比原数据多两个数据项

#import "CommonCarouselView.h"

@interface CommonCarouselView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) BOOL isAutoPlay;

@end

@implementation CommonCarouselView

#pragma mark- Live circle
#pragma mark- Overwrite
#pragma mark- Delegate
//UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentX = scrollView.contentOffset.x;
    
    //set scrollView offSet
    if (_dataArray.count >= 3) {
        if (currentX >= _itemWidth * (_dataArray.count - 1)) {
            currentX = _itemWidth; //last to first
        } else if (currentX <= 0) {
            currentX = _itemWidth * (_dataArray.count - 2); //first to last
        }
        [_scrollView setContentOffset:CGPointMake(currentX, 0) animated:YES];
    }
    /*
    //set page
    CGFloat currentPage = (scrollView.contentOffset.x + _itemWidth/2) / _itemWidth;
    if (_dataArray.count > 1) {
        currentPage --;
        if (currentPage >= _pageControl.numberOfPages) {
            currentPage = 0;
        } else if (currentPage < 0) {
            currentPage = _pageControl.numberOfPages - 1;
        }
    }
    
    if (currentPage != _pageControl.currentPage) {
        
    }
    
    _pageControl.currentPage = currentPage;
    */
}

#pragma mark- Notification methods
#pragma mark- Interface methods
- (id)initWithFrame:(CGRect)frame delegate:(id<CommonCarouselViewDelegate>)delegate dataItems:(NSArray *)items
{
    return [self initWithFrame:frame delegate:delegate dataItems:items isAuto:YES];
}

- (id)initWithFrame:(CGRect)frame delegate:(id<CommonCarouselViewDelegate>)delegate dataItems:(NSArray *)items isAuto:(BOOL)isAuto
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = items;
        self.isAutoPlay = isAuto;
        
        [self prepare];
        [self placeSubViews];
    }
    return self;
}

- (void)scrollToIndex:(NSInteger)index
{
    
}

#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    
}

- (void)placeSubViews
{
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    _pageControl.numberOfPages = _dataArray.count > 1 ? _dataArray.count - 2 : _dataArray.count;
    _pageControl.currentPage = 0;
    
    self.itemWidth = _scrollView.bounds.size.width;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = _scrollView.bounds.size.width;
    CGFloat h = _scrollView.bounds.size.height;
    
    for (int i = 0; i < self.dataArray.count; i ++) {
        UIColor *color = [_dataArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] init];
        x = i * _scrollView.bounds.size.width;
        imageView.frame = CGRectMake(x, y, w, h);
        imageView.backgroundColor = color;
        [_scrollView addSubview:imageView];
    }
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.bounds.size.width * _dataArray.count, _scrollView.bounds.size.height)];
    
    if (self.dataArray.count > 1) {
        if (_isAutoPlay) {
            
        }
    }
}

#pragma mark- Setter and getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.scrollsToTop = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 10, self.bounds.size.width, 10)];
        _pageControl.backgroundColor = [UIColor orangeColor];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

@end
