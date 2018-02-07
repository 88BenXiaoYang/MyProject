//
//  BYSectionTypeACell.m
//  Apps
//
//  Created by by on 2018/1/4.
//  Copyright © 2018年 BY. All rights reserved.
//

#import "BYSectionTypeACell.h"

@interface BYSectionTypeACell ()

@property (nonatomic, strong) UICollectionView *itemsView;

@end

@implementation BYSectionTypeACell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self prepare];
//        [self placeSubViews];
    }
    return self;
}

- (void)prepare
{
    
}

- (void)placeSubViews
{
    [self.contentView addSubview:self.itemsView];
    
//    [_itemsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
}

- (UICollectionView *)itemsView
{
    if (!_itemsView) {
        _itemsView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        _itemsView.backgroundColor = [UIColor whiteColor];
    }
    return _itemsView;
}

@end
