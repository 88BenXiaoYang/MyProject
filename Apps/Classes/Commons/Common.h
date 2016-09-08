//
//  Common.h
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#ifndef Common_h
#define Common_h

//屏幕宽、高
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//绿色背景
#define BG_Color [UIColor colorWithRed:143.0/255 green:188.0/255 blue:5.0/255 alpha:1.0]
#define BG_Color_Sub [UIColor grayColor]

//弱引用
#define BYWeakSelf(type) __weak typeof(type) weak##type = type;

//Log
#define BYLog(...) NSLog(__VA_ARGS__);
#define BYLogFunc  BYLog(@"%s", __FUNCTION__);
#define BYLogLine  BYLog(@"Line : %d", __LINE__);

//友盟统计
#if KAppA
#define UMENG_APP_KEY            @"53c4d96456240b5ded0d409c" //teacher
#elif KAppB
#define UMENG_APP_KEY            @"53c4d9dd56240bda10033520" //parent
#endif

#endif /* Common_h */
