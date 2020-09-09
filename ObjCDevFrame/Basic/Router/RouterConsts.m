//
//  RouterConsts.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/5/11.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "RouterConsts.h"

NSString *const ControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式
// 默认路由
NSString *const DefaultRouteSchema = @"BaseMVVM";
// 网络跳转路由模式
NSString *const HTTPRouteSchema    = @"http";
NSString *const HTTPsRouteSchema   = @"https";
// WEB交互路由跳转模式
NSString *const WebHandlerRouteSchema                = @"devframe";
// 发起通信
NSString *const ComponentsCallRouteSchema            = @"mainapp";
// 回调通信
NSString *const ComponentsCallBackHandlerRouteSchema = @"AppCallBack";
// 未知路由
NSString *const UnknownHandlerRouteSchema            = @"UnKnown";

#pragma mark - 路由表
// 导航栏 Push
NSString *const NavPushRoute            = @"/com_devframe_navPush/:viewController";
// 导航栏 Present
NSString *const NavPresentRoute         = @"/com_devframe_navPresent/:viewController";
// StoryBoard Push
NSString *const NavStoryBoardPushRoute  = @"/com_devframe_navStoryboardPush/:viewController";
// 组件通信回调
NSString *const ComponentsCallBackRoute = @"/com_devframe_callBack/*";
