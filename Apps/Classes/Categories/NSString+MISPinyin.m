//
//  NSString+MISPinyin.m
//  edua
//
//  Created by mao on 11/13/15.
//  Copyright © 2015 aspire. All rights reserved.
//

#import "NSString+MISPinyin.h"
#import "MISPinyin.h"

/***
 注！！！
 引入MISPinyin.h文件时
 要包含Array.c、SearchCore.c文件
 ***/

@implementation NSString(MISPinyin)

- (NSString *)pinyin {
 
	return [MISPinyin pinyinWithHanzi:self];
}


@end
