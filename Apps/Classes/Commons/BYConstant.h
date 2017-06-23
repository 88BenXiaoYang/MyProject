//
//  BYConstant.h
//  Apps
//
//  Created by BianYong on 16/8/24.
//  Copyright © 2016年 BY. All rights reserved.
//  定义枚举值

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TypeStyle) {
	TypeStyleDefault
};

typedef NS_ENUM(NSInteger, RequestType) {
	RequestTypeGet = 10,
	RequestTypePost
};

typedef NS_ENUM(NSInteger, RequestResultType) {
	RequestResultTypeData = 100,
	RequestResultTypeJSON
};

@interface BYConstant : NSObject

@end
