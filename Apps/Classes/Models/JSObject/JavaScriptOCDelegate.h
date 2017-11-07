//
//  JavaScriptOCDelegate.h
//  tmpProject
//
//  Created by bianyong on 2017/11/1.
//  Copyright © 2017年 bianyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JavaScriptOCDelegate <JSExport>

//调用在JS方法里面调用的对象方法，参考资料：http://www.jianshu.com/p/f896d73c670a
- (void)methodInObj:(NSString *)arg;

//此处我们测试几种参数的情况
-(void)TestNOParameter;
-(void)TestOneParameter:(NSString *)message;
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;

@end
