//
//  BookMarkView.m
//  tmpProject
//
//  Created by bianyong on 2017/11/3.
//  Copyright © 2017年 bianyong. All rights reserved.
//

#import "BookMarkView.h"

//collectionView type tag
#define kCollectionViewTypeTitleView 1111
#define kCollectionViewTypeContentView 2222
#define kTitleViewBottomLineHeight 0.5

//UICollectionViewCell identifier
static NSString * _Nullable bookMarkTitleItemCellIdentifier = @"BookMarkTitleItemCellIdentifier";
static NSString * _Nullable bookMarkContentItemCellIdentifier = @"BookMarkContentItemCellIdentifier";

@interface BookMarkView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *titleItemsArray;
@property (nonatomic, strong) NSMutableArray *contentItemsArray;
@property (nonatomic, assign) NSInteger currentBookMarkTitleItemIndex;

@end

@implementation BookMarkView

#pragma mark- Live circle
- (instancetype)init
{
    if (self = [super init]) {
        [self prepare];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [self removeKVO];
}

#pragma mark- Overwrite
- (void)reloadData
{
    self.titleItemsArray = [self.dataSource numberOfTitleItemsInBookMarkView:self];
    self.contentItemsArray = [self.dataSource numberOfContentItemsInBookMarkView:self];
    
    [self.bookMarkTitleView reloadData];
}

#pragma mark- Delegate
//UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger itemsCount = collectionView.tag == kCollectionViewTypeTitleView ? self.titleItemsArray.count : self.contentItemsArray.count;
    return itemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == kCollectionViewTypeTitleView) {
        BookMarkTitleItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bookMarkTitleItemCellIdentifier forIndexPath:indexPath];
        if (self.sliderColor) {
            cell.sliderColor = self.sliderColor;
        }
        cell.selected = _currentBookMarkTitleItemIndex == indexPath.row ? YES : NO;
        
        return cell;
    } else {
        BookMarkContentItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bookMarkContentItemCellIdentifier forIndexPath:indexPath];
        if ([self.dataSource respondsToSelector:@selector(bookMarkView:cellForIndexPath:configContentViewInBookMarkContentItemCell:)]) {
            [self.dataSource bookMarkView:self cellForIndexPath:indexPath configContentViewInBookMarkContentItemCell:cell];
        }
        
        return cell;
    }
    return nil;
}

//UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == kCollectionViewTypeTitleView) {
        [self.bookMarkContentView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

//UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == kCollectionViewTypeTitleView) {
        return CGSizeMake(100.0f, 50.0f);
    }
    
    if ([self.delegate respondsToSelector:@selector(bookMarkView:itemSizeForIndexPath:)]) {
        return [self.delegate bookMarkView:self itemSizeForIndexPath:indexPath];
    }
    
    return CGSizeZero;
}

//importance code !!!
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGFloat currentX = [[change objectForKey:@"new"] CGPointValue].x;
        CGFloat currentIndex = currentX/kDeviceWidth;
        _currentBookMarkTitleItemIndex = currentIndex + 0.45; //+0.45，添加偏移增量，以便在未完全触发翻页的情况下，界面产生问题（轻拖scrollerview，bookMark的sliderView位置会发生改变）
        if (self.titleItemsArray.count > _currentBookMarkTitleItemIndex) {
            [self.bookMarkTitleView reloadData];
            [self.bookMarkTitleView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentBookMarkTitleItemIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    }
    
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
    [self addKVO];
}

- (void)addKVO
{
    [self.bookMarkContentView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.bookMarkContentView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)removeKVO
{
    [self.bookMarkContentView removeObserver:self forKeyPath:@"frame"];
    [self.bookMarkContentView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark- Setter and getter
- (NSMutableArray *)titleItemsArray
{
    if (!_titleItemsArray) {
        _titleItemsArray = [NSMutableArray array];
    }
    return _titleItemsArray;
}

- (NSMutableArray *)contentItemsArray
{
    if (!_contentItemsArray) {
        _contentItemsArray = [NSMutableArray array];
    }
    return _contentItemsArray;
}

- (UICollectionView *)bookMarkTitleView
{
    if (!_bookMarkTitleView) {
        //collectionViewCell的默认值
        //列间距：10.0（minimumInteritemSpacing）
        //行间距：10.0（minimumLineSpacing）
        //itemSize：50.0，50.0
        //预估值：0.0（estimatedItemSize）
        //sectionInset：0.0
        
        //set collectionViewCell
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        _bookMarkTitleView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _bookMarkTitleView.tag = kCollectionViewTypeTitleView;
        _bookMarkTitleView.delegate = self;
        _bookMarkTitleView.dataSource = self;
        _bookMarkTitleView.backgroundColor = [UIColor greenColor];
        _bookMarkTitleView.showsVerticalScrollIndicator = NO;
        _bookMarkTitleView.showsHorizontalScrollIndicator = NO;
        
        [_bookMarkTitleView registerClass:[BookMarkTitleItemCell class] forCellWithReuseIdentifier:bookMarkTitleItemCellIdentifier];
    }
    return _bookMarkTitleView;
}

- (UICollectionView *)bookMarkContentView
{
    if (!_bookMarkContentView) {
        //set collectionViewCell
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0.0;
        flowLayout.minimumInteritemSpacing = 0.0;
        
        _bookMarkContentView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _bookMarkContentView.tag = kCollectionViewTypeContentView;
        _bookMarkContentView.delegate = self;
        _bookMarkContentView.dataSource = self;
        _bookMarkContentView.pagingEnabled = YES;
        _bookMarkContentView.backgroundColor = [UIColor yellowColor];
        _bookMarkContentView.showsVerticalScrollIndicator = NO;
        _bookMarkContentView.showsHorizontalScrollIndicator = NO;
        
        [_bookMarkContentView registerClass:[BookMarkContentItemCell class] forCellWithReuseIdentifier:bookMarkContentItemCellIdentifier];
    }
    return _bookMarkContentView;
}

- (void)setPresetCurrentIndex:(NSInteger)presetCurrentIndex
{
    if (presetCurrentIndex > self.titleItemsArray.count) {
        return;
    }
    
    _currentBookMarkTitleItemIndex = presetCurrentIndex - 1;
    [self.bookMarkContentView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentBookMarkTitleItemIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (NSInteger)currentIndex
{
    return _currentBookMarkTitleItemIndex;
}

- (void)setTitleViewBottomLineWidth:(CGFloat)titleViewBottomLineWidth
{
    CALayer *bottomLineLayer = [CALayer layer];
    bottomLineLayer.frame = CGRectMake(0, self.bookMarkTitleView.bounds.size.height - kTitleViewBottomLineHeight, titleViewBottomLineWidth, kTitleViewBottomLineHeight);
    bottomLineLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.bookMarkTitleView.layer addSublayer:bottomLineLayer];
}

@end
