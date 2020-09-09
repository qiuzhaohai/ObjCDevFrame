//
//  AppDelegate+Config.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/5/11.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "JLRoutes.h"
#import "RouterConsts.h"

#pragma mark - 初始化 SVProgressHUD 配置
@implementation AppDelegate(Config)

- (void)initAppConfig {
    // ProgressHUD 配置
    [ProgressHUDManager configProgressHUDWithCornerRadius:5.f styleType:SVProgressHUDStyleDark animationType:SVProgressHUDAnimationTypeNative];
    // 注册导航路由
    [self registerNavgationRouter];
    // 注册 Schema 路由
    [self registerSchemaRouter];
    
}

/******************************************************************************/

#pragma mark - 普通的跳转路由注册

- (void)registerNavgationRouter {
    // push
    // 路由 /com_devframe_navPush/:viewController
    [[JLRoutes globalRoutes] addRoute:NavPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:NO parameters:parameters];
        });
        return YES;
    }];

    // present
    // 路由 /com_devframe_navPresent/:viewController
    [[JLRoutes globalRoutes] addRoute:NavPresentRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:YES parameters:parameters];
        });
        return YES;
    }];

    // push
    // 路由 /com_devframe_navStoryboardPush/:viewController
    [[JLRoutes globalRoutes] addRoute:NavStoryBoardPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return YES;
    }];
}

#pragma mark - Schema 匹配
- (void)registerSchemaRouter {
    // HTTP注册
    [[JLRoutes routesForScheme:HTTPRouteSchema] addRoute:@"/somethingHTTP" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
    }];
    // HTTPS注册
    [[JLRoutes routesForScheme:HTTPsRouteSchema] addRoute:@"/somethingHTTPs" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
    }];
    // 自定义 Schema注册
    [[JLRoutes routesForScheme:WebHandlerRouteSchema] addRoute:@"/somethingCustom" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
    }];
}


/******************************************************************************/

#pragma mark - Private
/// 处理跳转事件
- (void)_handlerSceneWithPresent:(BOOL)isPresent parameters:(NSDictionary *)parameters {
    // 当前控制器
    NSString *controllerName = [parameters objectForKey:ControllerNameRouteParam];
    UIViewController *currentVC = [self _currentViewController];
    UIViewController *toVC = [[NSClassFromString(controllerName) alloc] init];
//    toVC.params = parameters;
    if (currentVC && currentVC.navigationController) {
        if (isPresent) {
            [currentVC.navigationController presentViewController:toVC animated:YES completion:nil];
        } else {
            toVC.hidesBottomBarWhenPushed = YES;
            [currentVC.navigationController pushViewController:toVC animated:YES];
        }
    }
}

/// 获取当前控制器
- (UIViewController *)_currentViewController {
    UIViewController * currentVC = nil;
    UIViewController * rootVC = self.window.rootViewController;
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)rootVC;
            UIViewController * vc = [nav.viewControllers lastObject];
            currentVC = vc;
            rootVC = vc.presentedViewController;
            continue;
        } else if ([rootVC isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)rootVC;
            currentVC = tabVC;
            rootVC = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (rootVC != nil);

    return currentVC;
}

@end
