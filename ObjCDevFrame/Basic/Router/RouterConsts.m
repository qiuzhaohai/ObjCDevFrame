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
NSString *const DefaultRouteSchema = @"BaseMVVM";
NSString *const HTTPRouteSchema = @"http";
NSString *const HTTPsRouteSchema = @"https";

NSString *const ComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const ComponentsCallRouteSchema = @"mainapp";

NSString *const WebHandlerRouteSchema = @"devframe";
NSString *const UnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表
NSString *const NavPushRoute = @"/com_devframe_navPush/:viewController";
NSString *const NavPresentRoute = @"/com_devframe_navPresent/:viewController";
NSString *const NavStoryBoardPushRoute = @"/com_devframe_navStoryboardPush/:viewController";
NSString *const ComponentsCallBackRoute = @"/com_devframe_callBack/*";
