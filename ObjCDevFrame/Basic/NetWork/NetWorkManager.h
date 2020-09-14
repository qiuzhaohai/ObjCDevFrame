//
//  NetWorkManager.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/12.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OPDataResponse.h"
#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NetworkType) {
    NetworkTypeNo, // 无网络
    NetworkTypeUnknown, // 未知网络
    NetworkTypeWiFi, // WiFi
    NetworkTypeMobile, // 移动网络
};

typedef NS_ENUM(NSUInteger, HTTPRequestType) {
    HTTPRequestTypeGET,
    HTTPRequestTypePOST
};


@interface NetWorkManager : NSObject

/// 网络类型
@property(nonatomic, assign) NetworkType networkType;

/// 通用请求头
@property(nonatomic) NSMutableDictionary<NSString * , NSString *> *commonHeaders;

#pragma mark -
/**
初始化本类单例
@return 单例
*/
+ (NetWorkManager *)sharedNetWorkManager;
/**
 * 创建网络请求管理类单例对象
 */
+ (AFHTTPSessionManager *)sharedSessionOperationManager;

#pragma mark -
/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @return 带请求结果（字典）的信号
*/
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params;
/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @return 带请求结果的信号
*/
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType;
/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @return 带请求结果的信号
*/
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz;
/**
 GET请求
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @param  headers      请求自带的请求头
 @return 带请求结果的信号
*/
+ (RACSignal *)racGETWithURL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz headers:(NSDictionary<NSString * , NSString *> *) headers;
/**
 POST请求
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @param  headers      请求自带的请求头
 @return 带请求结果的信号
*/
+ (RACSignal *)racPOSTWithURL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz headers:(NSDictionary<NSString * , NSString *> *) headers;
@end

NS_ASSUME_NONNULL_END
