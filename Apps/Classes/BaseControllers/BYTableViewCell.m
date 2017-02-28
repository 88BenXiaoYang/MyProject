//
//  BYTableViewCell.m
//  Apps
//
//  Created by BianYong on 16/10/11.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYTableViewCell.h"

static NSMutableDictionary *sharedCellInfo = nil;

@implementation BYTableViewCell

+ (void)initialize {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedCellInfo = [NSMutableDictionary dictionary];
	});
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self prepare];
		
		[self placeSubViews];
	}
	return self;
}

- (void)prepare {
	//for subclass
}

- (void)placeSubViews {
	//for subclass
}

/**
 *  更新Cell
 *
 *  @param obj 指定obj
 */
- (void )updateCellWithObj:(id )obj {
	//For subclass
}

/**
 *  获取高度-子类定高的要复写
 *
 *  @param obj 指定obj
 *
 *  @return 高度
 */
+ (CGFloat )heightForCellWithObj:(id )obj {
	BYTableViewCell *cell = [self sharedLayoutCell];
	[cell updateCellWithObj:obj];
	
	return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f;
}

/**
 *  获取共享的布局cell
 *
 *  @return obj
 */
+ (id )sharedLayoutCell {
	@synchronized(self) {
		BYTableViewCell *sharedCell = [sharedCellInfo objectForKey:NSStringFromClass([self class])];
		
		if (!sharedCell) {
			sharedCell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
			sharedCellInfo[NSStringFromClass([self class])] = sharedCell;
		}
		return sharedCell;
	}
}

/**
 *  复用标识
 *
 *  @return NSString obj
 */
+ (NSString *)reuseIdentifier {
	//For subclass
	return [NSString stringWithFormat:@"%@ReuseIdentifier", NSStringFromClass([self class])];
}

@end
