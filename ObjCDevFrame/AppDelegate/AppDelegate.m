//
//  AppDelegate.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/20.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序运行
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
// 进入非活动状态
- (void)applicationWillResignActive:(UIApplication *)application {
}
// 进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
}

// 即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
// 进入激活状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
// 结束
- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)) {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
