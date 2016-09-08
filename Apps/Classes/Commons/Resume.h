//
//  Resume.h
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#ifndef Resume_h
#define Resume_h


#endif /* Resume_h */

/****************************   知识点整理
 __OBJC__ : 这个宏定义的作用是保证只有oc文件可以调用pch里面的头文件，一些非oc语言不能调用，比如.cpp,.mm。如果不加入，那么如果代码中带有.cpp,.mm文件，那么将报错。NSObjCRuntime.h  NSObject.h  NSZone.h将会报出编译异常。
 
 .pch : 文件里存放工程中一些不常被修改的代码，比如常用的框架头文件，这样做的目的是提高编译器编译速度。
 注: 修改一个工程中某个文件代码时候，编译器并不是重新编译所有所有文件，而是编译改动过文件的，假如pch中某个文件修改了，那么pch整个文件里包含的的其他文件也会重新编译一次，这样就会消耗大量时间。
 
 __OPTIMIZE__ : Release模式下会定义__OPTIMIZE__，Debug模式下则不会（也可用DEBUG：Debug模式下会定义DEBUG，Release模式下则不会）。可用于NSLog不打印设置，在pch中处理
 
 友盟统计：
 参考资料：
 官网文档：http://dev.umeng.com/analytics/ios-doc/integration
 博客：http://www.jianshu.com/p/661ecc30ce6a
 ****************************/
