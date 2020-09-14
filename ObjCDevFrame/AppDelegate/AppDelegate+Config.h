//
//  AppDelegate+Config.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/5/11.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <WebKit/WebKit.h>

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Config)
- (void)initAppConfig;

@end

@interface AppDelegate (JLRoutes)

- (void)registerNavgationRouter;
- (void)registerSchemaRouter;

@end

NS_ASSUME_NONNULL_END
