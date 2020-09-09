//
//  RouterConsts.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/5/11.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface RouterConsts : NSObject

// 路由默认控制器参数名
FOUNDATION_EXTERN NSString *const ControllerNameRouteParam;

#pragma mark - 路由模式 Schema
/**
 模式 Native：AppSchema://url/:param
 */
// 默认路由
FOUNDATION_EXTERN NSString *const DefaultRouteSchema;
// 网络跳转路由模式
FOUNDATION_EXTERN NSString *const HTTPRouteSchema;
FOUNDATION_EXTERN NSString *const HTTPsRouteSchema;
// WEB交互路由跳转模式
FOUNDATION_EXTERN NSString *const WebHandlerRouteSchema;
// 发起通信
FOUNDATION_EXTERN NSString *const ComponentsCallRouteSchema;
// 回调通信
FOUNDATION_EXTERN NSString *const ComponentsCallBackHandlerRouteSchema;
// 未知路由
FOUNDATION_EXTERN NSString *const UnknownHandlerRouteSchema;


#pragma mark - 路由表
// 导航栏 Push
FOUNDATION_EXTERN NSString *const NavPushRoute;
// 导航栏 Present
FOUNDATION_EXTERN NSString *const NavPresentRoute;
// StoryBoard Push
FOUNDATION_EXTERN NSString *const NavStoryBoardPushRoute;
// 组件通信回调
FOUNDATION_EXTERN NSString *const ComponentsCallBackRoute;

@end

NS_ASSUME_NONNULL_END
