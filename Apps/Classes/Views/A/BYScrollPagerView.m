//
//  BYScrollPagerView.m
//  Apps
//
//  Created by BianYong on 17/3/2.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYScrollPagerView.h"

#pragma mark- size
static CGFloat titleHeight = 44;
static CGFloat indicateLineHeight = 2;
static NSInteger titleBtnCommonTag = 100;

@interface BYScrollPagerView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *titleScrollView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) UIView *titleContainerView;
@property (nonatomic, strong) UIView *contentContainerView;
@property (nonatomic, strong) UIImageView *titleIndicateLineImageView;

@property (nonatomic, strong) NSMutableArray *titleElementArray;   //container UIView obj. In order to cache the rect of UIView obj
@property (nonatomic, strong) NSMutableArray *contentElementArray; //container UIView obj. In order to cache the rect of UIView obj

@property (nonatomic, assign) NSInteger currentSelectedTitleIndex;

@end

@implementation BYScrollPagerView
#pragma mark- Live circle
- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self prepare];
	}
	return self;
}

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	
	NSInteger curIndex = self.currentSelectedTitleIndex - titleBtnCommonTag;
	[self selectedWithIndex:curIndex animation:NO moveScrollView:NO];
}

- (void)dealloc
{
	MISLogFunc
}

#pragma mark- Overwrite
#pragma mark- Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	NSInteger index = roundf(ABS(scrollView.contentOffset.x / scrollView.frame.size.width));
	self.currentSelectedTitleIndex = index + titleBtnCommonTag;
}

#pragma mark- Notification methods
#pragma mark- Interface methods
- (void)setScrollPagerTitles:(NSArray *)titles contents:(NSArray *)contents
{
	if (titles.count == 0 || contents.count == 0) {
		return;
	}
	
	[self layoutTitleView:titles];
	[self layoutContentView:contents];
}

#pragma mark- Event Response methods
- (void)titleTaped:(UIButton *)sender
{
	self.currentSelectedTitleIndex = sender.tag;
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)prepare
{
	self.animationDuration = 0.2;
	
	[self addSubview:self.titleScrollView];
	[self addSubview:self.contentScrollView];
	
	[self.titleScrollView addSubview:self.titleContainerView];
	[self.contentScrollView addSubview:self.contentContainerView];
	
	[self.titleContainerView addSubview:self.titleIndicateLineImageView];
	
	[self placeSubviews];
}

- (void)placeSubviews
{
	[_titleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self);
		make.top.equalTo(self);
		make.right.equalTo(self);
		make.height.mas_equalTo(titleHeight);
	}];
	
	[_contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self);
		make.right.equalTo(self);
		make.top.equalTo(_titleScrollView.mas_bottom);
		make.bottom.equalTo(self);
	}];
}

- (void)layoutTitleView:(NSArray *)titles
{
	if (titles.count == 0) {
		return;
	}
	
	[self.titleElementArray removeAllObjects];
	
	for (UIView *v in self.titleContainerView.subviews) {
		if ([v isKindOfClass:[UIButton class]]) {
			[v removeFromSuperview];
		}
	}
	
	[_titleIndicateLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(_titleContainerView).offset(-indicateLineHeight);
		make.height.mas_equalTo(indicateLineHeight);
	}];
	
	UIView *lastV;
	
	for (int i = 0; i < titles.count; i++) {
		NSString *titleStr = titles[i];
		UIButton *titleBtn = [self titleButton:titleStr];
		titleBtn.tag = i + titleBtnCommonTag;
		
		[_titleElementArray addObject:titleBtn]; //cache titleBtn
		[_titleContainerView addSubview:titleBtn];
		
		[titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(lastV ? lastV.mas_right : nil).offset(10);
			make.centerY.equalTo(_titleContainerView);
		}];
		
		lastV = titleBtn;
	}
	
	[_titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(_titleScrollView);
		make.top.equalTo(_titleScrollView);
		make.height.mas_equalTo(titleHeight);
		make.right.equalTo(lastV).offset(10);
	}];
	
	//约束控件的边界，同时根据最终子控件的size设置ScrollView的contentInset
	[_titleContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(_titleScrollView);
	}];
}

- (void)layoutContentView:(NSArray *)contents
{
	if (contents.count == 0) {
		return;
	}
	
	[self.contentElementArray removeAllObjects];
	
	for (UIView *v in self.contentContainerView.subviews) {
		[v removeFromSuperview];
	}
	
	UIView *lastV;
	
	for (int j = 0; j < contents.count; j++) {
		UIColor *bgCo = j%2 == 0 ? [UIColor orangeColor] : BG_Color;
		
		UIView *contentV = [self contentView:bgCo];
		
		[_contentElementArray addObject:contentV]; //cache contentV
		[_contentContainerView addSubview:contentV];
		
		[contentV mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(lastV ? lastV.mas_right : nil);
			make.top.equalTo(_contentContainerView);
			make.bottom.equalTo(_contentContainerView);
			make.width.mas_equalTo(self.bounds.size.width);
		}];
		
		lastV = contentV;
	}
	
	CGFloat contentScrollViewHeight = self.bounds.size.height - STATUSBAR_HEIGHT - NavigationBar_HEIGHT - titleHeight;
	[_contentContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(_contentScrollView);
		make.top.equalTo(_contentScrollView);
		make.right.equalTo(lastV);
		make.height.mas_equalTo(contentScrollViewHeight);
	}];
	
	[_contentContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(_contentScrollView);
	}];
}

//action methods
/**
 *  设置当前标题项被选中
 *
 *  @param selectedIndex  选中的序号
 *  @param animation      是否要执行动画
 *  @param moveScrollView 是不是要跟着移动内容
 */
- (void)selectedWithIndex:(NSInteger)index animation:(BOOL)animation moveScrollView:(BOOL)moveScrollView
{
	[self moveToIndex:index animaiton:animation moveScrollView:moveScrollView];
}

/**
 *  移动到对应的序号
 *
 *  @param index          选中的序号
 *  @param animation      是否要执行动画
 *  @param moveScrollView 是不是要跟着移动内容
 */
- (void)moveToIndex:(NSInteger)index animaiton:(BOOL)animation moveScrollView:(BOOL)moveScrollView
{
	if (_titleElementArray.count == 0) {
		return;
	}
	
	UIButton *btn = [_titleElementArray objectAtIndex:index];
	
	[UIView animateWithDuration:(animation ? self.animationDuration : 0.0f) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		CGRect frame = _titleIndicateLineImageView.frame;
		frame.origin.x = btn.frame.origin.x;
		frame.size.width = btn.frame.size.width;
		_titleIndicateLineImageView.frame = frame;
	} completion:^(BOOL finished) {
		[_titleScrollView scrollRectToVisible:btn.frame animated:YES];
	}];
	
	UIView *v = [_contentElementArray objectAtIndex:index];
	if (moveScrollView) {
		[_contentScrollView scrollRectToVisible:v.frame animated:YES];
	} else {
		[_contentScrollView scrollRectToVisible:v.frame animated:NO];
	}
}

#pragma mark- Setter and getter
- (UIScrollView *)titleScrollView
{
	if (!_titleScrollView) {
		_titleScrollView = [UIScrollView autoLayoutScrollView];
		_titleScrollView.backgroundColor = [UIColor redColor];
		_titleScrollView.showsHorizontalScrollIndicator = NO;
	}
	return _titleScrollView;
}

- (UIScrollView *)contentScrollView
{
	if (!_contentScrollView) {
		_contentScrollView = [UIScrollView autoLayoutScrollView];
		_contentScrollView.backgroundColor = [UIColor blueColor];
		_contentScrollView.pagingEnabled = YES;
		_contentScrollView.delegate = self;
	}
	return _contentScrollView;
}

- (UIView *)titleContainerView
{
	if (!_titleContainerView) {
		_titleContainerView = [UIView autoLayoutView];
		_titleContainerView.backgroundColor = WHITE_COLOR;
	}
	return _titleContainerView;
}

- (UIView *)contentContainerView
{
	if (!_contentContainerView) {
		_contentContainerView = [UIView autoLayoutView];
		_contentContainerView.backgroundColor = [UIColor purpleColor];
	}
	return _contentContainerView;
}

- (UIImageView *)titleIndicateLineImageView
{
	if (!_titleIndicateLineImageView) {
		_titleIndicateLineImageView = [UIImageView autoLayoutImageView];
		_titleIndicateLineImageView.backgroundColor = [UIColor purpleColor];
	}
	return _titleIndicateLineImageView;
}

- (UIButton *)titleButton:(NSString *)title
{
	UIButton *titleBtn = [UIButton autoLayoutButton];
	titleBtn.layer.cornerRadius = 5;
	titleBtn.layer.masksToBounds = YES;
	[titleBtn setTitle:title forState:UIControlStateNormal];
	[titleBtn setBackgroundImage:[BYUtils imageWithColor:UIColorFromRGB(0xA4AFB2)] forState:UIControlStateNormal];
	[titleBtn setBackgroundImage:[BYUtils imageWithColor:UIColorFromRGB(0xFD8023)] forState:UIControlStateSelected];
	[titleBtn addTarget:self action:@selector(titleTaped:) forControlEvents:UIControlEventTouchUpInside];
	
	return titleBtn;
}

- (UIView *)contentView:(UIColor *)bgColor
{
	UIView *contentV = [UIView autoLayoutView];
	contentV.backgroundColor = bgColor;
	
	return contentV;
}

- (NSMutableArray *)titleElementArray
{
	if (!_titleElementArray) {
		_titleElementArray = [NSMutableArray array];
	}
	return _titleElementArray;
}

- (NSMutableArray *)contentElementArray
{
	if (!_contentElementArray) {
		_contentElementArray = [NSMutableArray array];
	}
	return _contentElementArray;
}

- (void)setCurrentSelectedTitleIndex:(NSInteger)currentSelectedTitleIndex
{
	if (_currentSelectedTitleIndex != currentSelectedTitleIndex) {
		UIButton *btn;
		if (_currentSelectedTitleIndex != 0) {
			btn = [_titleContainerView viewWithTag:_currentSelectedTitleIndex];
			btn.selected = NO;
		}
		
		_currentSelectedTitleIndex = currentSelectedTitleIndex;
		btn = [_titleContainerView viewWithTag:currentSelectedTitleIndex];
		btn.selected = YES;
		
		NSInteger currentIndex = currentSelectedTitleIndex - titleBtnCommonTag;
		[self selectedWithIndex:currentIndex animation:YES moveScrollView:YES];
	}
}

- (void)setSelectedTitleIndex:(NSInteger)selectedTitleIndex
{
	self.currentSelectedTitleIndex = selectedTitleIndex + titleBtnCommonTag;
}

#pragma mark- Square area

@end
