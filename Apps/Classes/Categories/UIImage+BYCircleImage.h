//
//  UIImage+BYCircleImage.h
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BYCircleImage)

- (UIImage *)circleImageWithoutBgColorWithSize:(CGSize)size;

- (UIImage *)circleImageWithBgColor:(UIColor *)color edgeWidth:(CGFloat)edgeWidth size:(CGSize)size;

@end
