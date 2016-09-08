//
//  MISBase64Utils.h
//  JLJXT
//
//  Created by Mao on 8/25/15.
//  Copyright (c) 2015 Eduapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MISBase64 : NSObject

//Bse64 encode default:padded:YES Wrap NO
+ (NSString *)stringByEncodingData:(NSData *)data;

//Bse64 encode Wrap NO
+ (NSString *)stringByEncodingData:(NSData *)data
							padded:(BOOL)padded;

//WebSafe Base64 encode padded:NO Wrap NO
+ (NSString *)stringByWebSafeEncodingData:(NSData *)data;

//WebSafe Base64 encode Wrap NO
+ (NSString *)stringByWebSafeEncodingData:(NSData *)data
								   padded:(BOOL)padded;

//Base64 Decode padded:YES Wrap NO
+ (NSData *)decodeString:(NSString *)string;

//Base64 Decode Wrap NO
+ (NSData *)decodeString:(NSString *)string
				  padded:(BOOL)padded;

//WebSafe Base64 Decode padded:NO Wrap NO
+ (NSData *)webSafeDecodeString:(NSString *)string;

//WebSafe Base64 Decode Wrap NO
+ (NSData *)webSafeDecodeString:(NSString *)string
						 padded:(BOOL)padded;
@end
