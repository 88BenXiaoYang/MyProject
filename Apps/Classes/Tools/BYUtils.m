//
//  BYUtils.m
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYUtils.h"
#import <CommonCrypto/CommonCrypto.h>
#import "MISBase64.h"

@implementation BYUtils

+ (NSString *)stringWithXXTEncrypt:(NSString *)planText
{
	const char *cData = [planText cStringUsingEncoding:NSUTF8StringEncoding];
	
	uint8_t key[] = {0x3c, 0x23, 0x2a, 0x2b, 0x2a, 0x41, 0x73, 0x70, 0x69 ,0x72 ,0x65 ,0x2a, 0x2b, 0x2a, 0x23, 0x3e};
	
	uint8_t cHMAC[CC_SHA1_DIGEST_LENGTH];
	
	CCHmac(kCCHmacAlgSHA1, key, 16, cData, strlen(cData), cHMAC);
	
	NSData* hmacData = [NSData dataWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
	
	return [MISBase64 stringByEncodingData:hmacData];
}

+ (NSString *)md5:(NSString *)str{
	const char *cStr = [str UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
	return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

//图片处理相关
+ (UIImage *)imageWithRenderingModeCustomStyle:(UIImage *)image
{
	return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
	CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextFillRect(context, rect);
	
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}

+ (NSDictionary *)getTheWeekOfCurrentDate
{
	NSMutableDictionary *dateDict = [NSMutableDictionary dictionary];
	NSMutableArray *dateArr = [NSMutableArray array];
	
	NSDate *now = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *comp = [calendar components:
							  NSCalendarUnitYear |
							  NSCalendarUnitMonth |
							  NSCalendarUnitDay |
							  NSCalendarUnitWeekday fromDate:now];
	
	// 1(星期天) 2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六)
	NSInteger weekDay = [comp weekday]; //current weekday
	NSInteger day = [comp day]; //current day
	
	// 计算当前日期和这周的星期天和星期六差的天数（每周从周天开始，周六结束）
	NSInteger firstDiff, lastDiff;
	firstDiff = [calendar firstWeekday] - weekDay;
	lastDiff = 7 - weekDay;
	
	//获取一周内的时间
	if (firstDiff != 0) {
		for (NSInteger i = firstDiff; i < 0; i++) {
			[comp setDay:day + i];
			NSDate *dayOfWeek= [calendar dateFromComponents:comp];
			[dateArr addObject:dayOfWeek];
		}
		
		if (lastDiff != 0) {
			[dateArr addObject:now];
		}
		
	} else {
		[dateArr addObject:now];
	}
	
	if (lastDiff != 0) {
		for (NSInteger j = 1; j <= lastDiff; j++) {
			[comp setDay:day + j];
			NSDate *dayOfWeek= [calendar dateFromComponents:comp];
			[dateArr addObject:dayOfWeek];
		}
	} else {
		[dateArr addObject:now];
	}
	
	dateDict[@"dateArray"] = dateArr; //dateArr include NSDate elements
	dateDict[@"currentWeekDay"] = @(weekDay);
	
	return dateDict;
}

+ (NSString *)getWeekDayWithCurrentDate:(NSDate *)currentDate
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *comp = [calendar components:
							  NSCalendarUnitYear |
							  NSCalendarUnitMonth |
							  NSCalendarUnitDay |
							  NSCalendarUnitWeekday fromDate:currentDate];
	
	NSInteger weekDay = [comp weekday]; //current weekday
	
	NSArray *weekDayList = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
	NSString *currentWeekDay = [weekDayList objectAtIndex:weekDay-1];
	return currentWeekDay;
}

+ (NSString *)stringFromDate:(NSDate *)date withFmt:(NSString *)fmt{
	if (date == nil)
	{
		return @"";
	}
	NSDateFormatter* format = [[NSDateFormatter alloc] init];
	[format setDateFormat:fmt];
	return [format stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)str withFmt:(NSString *)fmt{
	if (str == nil || str.length == 0)
	{
		return nil;
	}
	NSDateFormatter* format = [[NSDateFormatter alloc] init];
	[format setDateFormat:fmt];
	return [format dateFromString:str];
}

@end
