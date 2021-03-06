//
//  NSDictionary+MISJSON.h
//  edua
//
//  Created by Mao on 11/9/15.
//  Copyright (c) 2015 aspire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(MISJSON)

/**
 *  字典转成JSON串
 *
 *  @return JSON串
 */
- (NSString *)JSONString;

/**
 *  字典转成JSON串-UTF8编码成Data
 *
 *  @return Data
 */
- (NSData *)JSONData;

@end
