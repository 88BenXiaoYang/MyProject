//
//  UIImage+mask.h
//  MyCamera
//
//  Created by Mao on 4/27/16.
//  Copyright © 2016 mao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(MISMask)

/**
 *  生成Mask后的图片
 *
 *  @param mask 传入黑色Mask图片
 *
 *  @return 新图片
 */

- (UIImage *)mis_imageWithMask:(UIImage *)mask;

@end
