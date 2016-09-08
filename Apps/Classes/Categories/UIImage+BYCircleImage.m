
//  UIImage+BYCircleImage.m
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UIImage+BYCircleImage.h"

@implementation UIImage (BYCircleImage)

- (UIImage *)circleImageWithoutBgColorWithSize:(CGSize)size
{
	//开启图片上下文 YES：不透明；NO：透明
	UIGraphicsBeginImageContextWithOptions(size, NO, 0);
	
	//设置路径区域
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
	
	//添加裁剪的路径区域，注：只有先添加了路径区域，后续画的图片才生效
	[path addClip];
	
	//画图
//	[self drawAtPoint:CGPointZero];//想获取图片的部分用这种绘制方式
	[self drawInRect:CGRectMake(0, 0, size.width, size.height)]; //drawInRect这种绘制方式，图片会按比例填充指定的区域，会绘制出图片的整体
	
	//绘画后的图片
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	
	//关闭图片上下文
	UIGraphicsEndImageContext();
	
	return img;
}

- (UIImage *)circleImageWithBgColor:(UIColor *)color edgeWidth:(CGFloat)edgeWidth size:(CGSize)size
{
	UIGraphicsBeginImageContextWithOptions(size, NO, 0);
	
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
	
	//设置背景色
	[color set];
	
	//填充路径内的区域
	[path fill];
	
	//图片区域路径
	CGRect imgRect = CGRectMake(edgeWidth, edgeWidth, size.width - 2*edgeWidth, size.height - 2*edgeWidth);
	UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:imgRect];
	
	[clipPath addClip];
	
	[self drawInRect:imgRect];
	
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return img;
}

@end
