//
//  Food.m
//  FoodsDemo
//
//  Created by BianYong on 17/5/11.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "Food.h"

@interface Food ()

@property (nonatomic,   copy) NSString *name;
@property (nonatomic,   copy) NSString *first;
@property (nonatomic,   copy) NSString *popularity;

@end

@implementation Food

- (id)initWithName:(NSString *)n first:(NSString *)f popularity:(NSString *)p
{
	if (self = [super init]) {
		self.name = n;
		self.first = f;
		self.popularity = p;
	}
	return self;
}

@end
