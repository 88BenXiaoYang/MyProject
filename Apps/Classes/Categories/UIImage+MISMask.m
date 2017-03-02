//
//  UIImage+MISMask.m
//  CQJXT
//
//  Created by Mao on 4/27/16.
//  Copyright © 2016 mao. All rights reserved.
//

#import "UIImage+MISMask.h"

@implementation UIImage(MISMask)

/**
 *  生成Mask后的图片
 *
 *  @param mask 传入黑色Mask图片
 *
 *  @return 新图片
 */

- (UIImage *)mis_imageWithMask:(UIImage *)mask {
	/**
	 *  计算缩放-像素 考虑到用@2x @3x 的图片 要加上scale
	 */
	CGFloat maskPixelWidth  = mask.size.width * mask.scale;
	CGFloat maskPixelHeight = mask.size.height * mask.scale;
	CGFloat pixelWidth = self.size.width * self.scale;
	CGFloat pixelHeight = self.size.height * self.scale;

    CGFloat scalex = maskPixelWidth / pixelWidth;
    CGFloat scaley = maskPixelHeight / pixelHeight;
    CGFloat scale  = MAX(scalex, scaley);

	/**
	 *  创建上下文
	 */
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate (NULL, maskPixelWidth, maskPixelHeight, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
	CGColorSpaceRelease(colorSpace);
	
	
	//AspectFill方式
    CGFloat width      = pixelWidth * scale;
    CGFloat height     = pixelHeight * scale;
    CGFloat dwidth     = (maskPixelWidth - width) / 2.0f;
    CGFloat dheight    = (maskPixelHeight - height) / 2.0f;
    CGRect maskRect    = CGRectMake(0, 0, maskPixelWidth, maskPixelHeight);
    CGRect imageRect   = CGRectMake(dwidth, dheight, width, height);
	
	//绘图
	CGContextClipToMask(context, maskRect, mask.CGImage);
	CGContextDrawImage(context, imageRect, self.CGImage);
	
	//生成
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
	CGContextRelease(context);

    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];

	CGImageRelease(newImageRef);

	return newImage;
}

@end
