//
//  NSData+BYJSONData.m
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "NSData+BYJSONData.h"

@implementation NSData (BYJSONData)

- (id)JSONData
{
	NSError *error = nil;
	
	id jsonData = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:&error];
	
	if (!jsonData) {
		NSLog(@"%s\n%@", __func__, error);
	}
	
	return jsonData;
}

@end
