//
//  SGFocusImageItem.h
//  ScrollViewLoop
//
//  Created by Vincent Tang on 13-7-18.
//  Copyright (c) 2013年 Vincent Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGFocusImageItem : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSInteger tag;

- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag;
@end
