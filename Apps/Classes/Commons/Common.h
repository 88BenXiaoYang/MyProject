//
//  Common.h
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#ifndef Common_h
#define Common_h

//状态栏高
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

//屏幕宽、高
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//绿色背景
#define BG_Color [UIColor colorWithRed:143.0/255 green:188.0/255 blue:5.0/255 alpha:1.0]
#define BG_Color_Sub [UIColor grayColor]
#define VIEW_BGCOLOR UIColorFromRGB(0xecedf1)
#define Clear_Color [UIColor clearColor]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//弱引用
#define BYWeakSelf(type) __weak typeof(type) weak##type = type;

//Log
#define BYLog(...) NSLog(__VA_ARGS__);
#define BYLogFunc  BYLog(@"%s", __FUNCTION__);
#define BYLogLine  BYLog(@"Line : %d", __LINE__);
#pragma mark- log
//---
#define MISLog(...) NSLog(__VA_ARGS__);
#define MISLogFunc  MISLog(@"%s", __FUNCTION__);
#define MISLogLine  MISLog(@"Line:%d", __LINE__);
#define MISLogFile  MISLog(@"%s", __FILE__);
#define MISLogObj(__OBJ)     MISLog(@"%s, %@", __FUNCTION__, __OBJ);
#define MISLogError(__ERROR) MISLog(@"%s, Error:%@", __FUNCTION__, __ERROR);

//友盟统计
#if KAppA
#define UMENG_APP_KEY            @"53c4d96456240b5ded0d409c" //teacher
//Bugly_AppID
#define Bugly_AppID @""
#elif KAppB
#define UMENG_APP_KEY            @"53c4d9dd56240bda10033520" //parent
//Bugly_AppID
#define Bugly_AppID @""
#endif

//控件传值
#define Image_With_Name(_name) [UIImage imageNamed:_name]

#endif /* Common_h */
