//
//  AppDelegate.m
//  Apps
//
//  Created by BianYong on 16/8/18.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "AppDelegate.h"
#import "BYMainViewController.h"
#import "BYMViewController.h"
#import <Bugly/Bugly.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	//友盟统计
	UMConfigInstance.appKey = UMENG_APP_KEY;
	[MobClick startWithConfigure:UMConfigInstance];
//	[MobClick setLogEnabled:YES]; //默认是 NO  前置条件：要配合注册测试设备
	
	/*
	 *初始化Bugly --- 注：是否有使用具有捕获Crash功能的其他第三方组件，若有将bugly的初始化放在该组件后面
	 */
	[Bugly startWithAppId:Bugly_AppID];
	
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	BYMainViewController *mainVC = [[BYMainViewController alloc] init];
//	BYMViewController *mainVC = [[BYMViewController alloc] init];
	self.window.rootViewController = mainVC;
	[self.window makeKeyAndVisible];
	
	[BYAppStyle setupStyle];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
