//
//  AppDelegate.m
//  07-应用中常见的文件
//
//  Created by tom-pc on 15/11/11.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序启动完成是会调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 提醒数字
    application.applicationIconBadgeNumber = 12;
    // 网络提醒
    application.networkActivityIndicatorVisible = YES;
    // 隐藏状态栏
//    application.statusBarHidden = YES;
    // 状态栏的样式
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}

// 程序将失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
}
// 进入到后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
// 应用将显示到前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
// 程序获取焦点
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
// 程序结束退出
- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
