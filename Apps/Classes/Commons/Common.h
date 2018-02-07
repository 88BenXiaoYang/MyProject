//
//  Common.h
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define IOS7 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0) ? YES : NO)

#define IOS8 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0) ? YES : NO)

#define IOS10 (([[[UIDevice currentDevice]systemVersion] floatValue] >= 10.0) ? YES : NO)

//状态栏高
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//NavBar高度
#define NavigationBar_HEIGHT 44.0f
//TabBar高度
#define TabBar_HEIGHT 49.0f
//ToolsBar高度
#define ToolsBar_HEIGHT 44.0f

//屏幕宽、高
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define VIEW_HEIGHT (SCREEN_HEIGHT - STATUSBAR_HEIGHT - NavigationBar_HEIGHT - ToolsBar_HEIGHT)
#define VIEW_WIDTH SCREEN_WIDTH

//常用颜色
#define CLEAR_COLOR [UIColor clearColor] //clear color
#define BLACK_COLOR [UIColor blackColor] //black color
#define WHITE_COLOR [UIColor whiteColor] //white color
#define GRAY_COLOR  [UIColor grayColor]  //grayColor color

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

//字体
#define NFont(__SIZE) [UIFont systemFontOfSize:__SIZE] //system font with size
#define IFont(__SIZE) [UIFont italicSystemFontOfSize:__SIZE] //system font with size
#define BFont(__SIZE) [UIFont boldSystemFontOfSize:__SIZE]//system bold font with size
#define Font(__NAME, __SIZE) [UIFont fontWithName:__NAME size:__SIZE] //font with name and size

//1个像素大小
#define MIS_ONE_PX (1.0f / [UIScreen mainScreen].scale)

#define IMAGE_WITH_NAME(_NAME) [UIImage imageNamed:_NAME]

// 家长版通用色调
#define Parent_Common_Color UIColorFromRGB(0x4c95f9)

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

/******************************** Alipay **************************************/
#define ALIPAY_PARTNERID        @"2088021458178941" //旧版本支付使用
#define ALIPAY_APPID            @"2016061201504543" //新版本支付使用
#define ALIPAY_PRIVATEKEY       @"MIICXQIBAAKBgQConZlicoY9QkvNhr6XhYJwsLeNgpiczP7/Je5lokwAFrPTbqNFGS15eXCxGOoqYVrjvZbFkvHVMO6Kq7Zx2fsDyBMl6YIcSyxOllx5IP9j4+MNkJKviQ10ocdrocv4/eSD1FJq/sdSfDT5dmvG+In4tvm6pFLlVOQIlo1qBVcaOQIDAQABAoGAAYyBDjBzHzjurVKhiY7GZfaZmQksEbSoWvukNvbIr++Fc1m+0jGrA0SkTlwmOoFubk0dh28UHZs3dbqiEGWqMpje+4OJiXzW5C2DeBotdkebCJbVFnIZVOMixQI6FgBASkgUxZcr49r40LQsqwoH5r7+L7t3SZoXSrvzrSKZ+ikCQQDcqFoE/uGuz71QYRh5yuqK8cfNMd3mIn148LSrKHuX6a85wKmP8v+N6kClqP8vWiXLaBY6+P+OxVKBs5AFfRx7AkEAw59dG1keYl3V/db4MSvGSezv630xPPPmzSF/Qd4TyxC3h2kSQR+U5zPleJN8pRDgJdtTwxIAZ1WkiuVL2Rsn2wJBALWZF/zkh3gHIBb20d3qUfzn3zfQwn6UBA90ijwSpSTw/XTaSrJdmlSBZZLw8pNV7aTplOIT6r7lRnHYBb9+p+ECQAkWzXeo012UqI2rwEpgk0z6Ake5wGDpoC6lwMjprZfAxhY3jo6SDhQT+DR6/c6ZkyCPKTwmCPjEJOoDL1v+BAMCQQCjVH+qLUw1tzzxtKNPbTgtACxCQkpdQ/p5uaPh/WrZNrciahpz1negG6kyl3yyNxsrs7r1QMAs+3YlssPS8VTo"

#define TEXT_SIGNSTRING         @"dqjq2oV%2B8G19gbuZUB8FtpZ3b5LaErD9wokWn6V71xziQdiFyTNbwvy1dtWTLeiSvVTHwlF6fUQQj9ZG50uKE0IV0JTX5N70u99LJPZrPcaDk5PVzoqn8XYxdBb1LEYFR2kat%2BAapL8%2FgMQZRR7QnYEiY%2BNZiAJdHip9Hqaqhs4%3D"

#define TEXT_OrderInfoEncoded   @"app_id=2016061201504543&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.01%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%221AF31ZYDKB34RJX%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA&timestamp=2017-06-02%2017%3A00%3A30&version=1.0"
/******************************** Alipay **************************************/

/******************************** WXpay **************************************/
#define WXAppID               @"wxba37c5c57006b455"
#define WXAppSecret           @"a51ac549069fc1f6a5319187aa108022"
#define WXAppPartnerid        @"1353983002"
#define WXAPPKey              @"qwertyuiop1234567890qwertyuiop12"
/******************************** AWXpay **************************************/

/******************************** Tencent **************************************/
#define QQAppID               @"1104791985"
/******************************** Tencent **************************************/

/******************************** 请求加密相关 **************************************/
#define   app_key                       @"IhNt7ft4GTEkG3KsGX9F/g=="
#define   app_version                   @"1.3"
/******************************** 请求加密相关 **************************************/

#endif /* Common_h */
