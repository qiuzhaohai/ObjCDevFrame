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
#define URL_DOMAIN URL_HEADER@"wcpublic.smec-cn.com:7777/simp/simp-uat/"
// UAT环境
//#define URL_DOMAIN @""
// PRO环境
//#define URL_DOMAIN @""
// 虚拟目录
#define APP_DOMAIN URL_DOMAIN@"eis/TEISService/"

//API
#define USER_LOGIN APP_DOMAIN@"userLogin"


#endif /* APIMacro_h */
