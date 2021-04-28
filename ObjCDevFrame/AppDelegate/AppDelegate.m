//
//  AppDelegate.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/20.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"
#import "RTRootNavigationController.h"
#import "MainTabBarControllerConfig.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序运行
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 配置
    [self initAppConfig];
    // 显示页面
    [self startJumpViewController];

//    [SmecEleCallQRCode bindAccount:@"18650457578" callback:^(SECCallbackResult *res) {
//
//    }];
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

#pragma mark - method

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}
/**
 * 启动App跳转页面
 */
- (void)startJumpViewController {
    // 读取保存在userDefaults的账号
    if (![[NSUserDefaults standardUserDefaults] stringForKey:UDAccountKey]) {
        // 未登录，进入登录页
        LoginViewController *loginViewController  = [[LoginViewController alloc] init];
        [self.window setRootViewController:loginViewController];
        [self.window makeKeyAndVisible];
    } else {
        // 已登录，进入首页
        MainTabBarControllerConfig *tabbarConfig  = [[MainTabBarControllerConfig alloc] init];
        CYLTabBarController *mainTabbarController = tabbarConfig.mainTabbarController;
        [mainTabbarController setSelectedIndex:1];
        [self.window setRootViewController:mainTabbarController];
        [self.window makeKeyAndVisible];
    }
}

@end
