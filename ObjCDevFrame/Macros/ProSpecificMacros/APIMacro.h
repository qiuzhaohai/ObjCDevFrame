//
//  APIMacro.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/26.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#ifndef APIMacro_h
#define APIMacro_h

#define URL_HEADER @"http://"
// DEV环境
#define URL_DOMAIN URL_HEADER@"192.168.1:7777/simp/uat/"
// UAT环境
//#define URL_DOMAIN @""
// PRO环境
//#define URL_DOMAIN @""
// 虚拟目录
#define APP_DOMAIN URL_DOMAIN@"server/"

//API
#define USER_LOGIN  APP_DOMAIN@"userLogin"
// 获取消息
#define GET_NEWS    APP_DOMAIN@"getMessage"
// 获取动态
#define GET_DYNAMIC APP_DOMAIN@"getNews"


#endif /* APIMacro_h */
