//
//  TestJSObject.m
//  tmpProject
//
//  Created by bianyong on 2017/11/1.
//  Copyright © 2017年 bianyong. All rights reserved.
//

#import "TestJSObject.h"

@implementation TestJSObject

-(void)TestNOParameter
{
    NSLog(@"this is ios TestNOParameter");
}
-(void)TestOneParameter:(NSString *)message
{
    NSLog(@"this is ios TestOneParameter=%@",message);
}
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2
{
    NSLog(@"this is ios TestTowParameter=%@  Second=%@",message1,message2);
}

- (void)methodInObj:(NSString *)arg
{
    NSLog(@"method in object with argument : %@", arg);
}

@end
