//
//  SystemMacro.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/23.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#ifndef SystemMacro_h
#define SystemMacro_h

//屏幕高宽
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
// 主窗口
#define KEYWINDOW       [UIApplication sharedApplication].keyWindow
// APP 版本号
#define DEVICE_APP_VERSION      (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
// App Build 版本号
#define DEVICE_APP_BUILD        (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 系统版本号（string）
#define DEVICE_OS_VERSION       [[UIDevice currentDevice] systemVersion]
// 系统版本号（float）
#define DEVICE_OS_VERSION_VALUE [DEVICE_OS_VERSION floatValue]

// 当前语言
#define CURRENTLANGUAGE [[NSLocale preferredLanguages] objectAtIndex:0])

#endif /* SystemMacro_h */
