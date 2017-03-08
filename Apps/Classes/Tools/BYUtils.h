//
//  BYUtils.h
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYUtils : NSObject

+ (NSString *)stringWithXXTEncrypt:(NSString *)planText;

+ (NSString *)md5:(NSString *)str;

//图片处理相关
+ (UIImage *)imageWithRenderingModeCustomStyle:(UIImage *)image;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
