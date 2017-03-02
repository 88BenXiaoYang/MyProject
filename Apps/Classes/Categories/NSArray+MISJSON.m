//
//  NSArray+MISJSON.m
//  edua
//
//  Created by Mao on 11/9/15.
//  Copyright (c) 2015 aspire. All rights reserved.
//

#import "NSArray+MISJSON.h"

@implementation NSArray(MISJSON)

- (NSString *)JSONString {
	NSData* data = [self JSONData];
	
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


- (NSData *)JSONData {
	NSError* error = nil;
	
	NSData* data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
	
	if (!data) {
		NSLog(@"%@", error);
	}
	
	return data;
}

@end
