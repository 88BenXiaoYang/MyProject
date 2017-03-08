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

@end
