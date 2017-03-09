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

//获取当前日期所在一周的日期
+ (NSDictionary *)getTheWeekOfCurrentDate;

//获取当前日期所在的星期
+ (NSString *)getWeekDayWithCurrentDate:(NSDate *)currentDate;

//date to string use fmt eg. fmt:@"yyyy-MM-dd" NSDate -> 2012-01-01
+ (NSString *)stringFromDate:(NSDate *)date withFmt:(NSString *)fmt;
//string to date use fmt eg. fmt:@"yyyy-MM-dd" 2012-01-01 ->NSDate
+ (NSDate *)dateFromString:(NSString *)str withFmt:(NSString *)fmt;

@end
