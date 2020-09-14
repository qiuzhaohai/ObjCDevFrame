//
//  NetWorkManager.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/12.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation NetWorkManager

// 单例
static NetWorkManager *sharedNetWorkManager = nil;

/**
 初始化本类单例
 @return 单例
 */
+ (NetWorkManager *)sharedNetWorkManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetWorkManager = [[super allocWithZone:NULL] init];
        
    });
    return sharedNetWorkManager;
}

+ (instancetype)allocWithZone:(NSZone *)zone {
    return [self sharedNetWorkManager];
}

/**
 * 创建网络请求管理类单例对象
 */
+ (AFHTTPSessionManager *)sharedSessionOperationManager {
    static AFHTTPSessionManager *httpSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpSessionManager = [AFHTTPSessionManager manager];
        //无条件的信任服务器上的证书
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        // 客户端是否信任非法证书
        securityPolicy.allowInvalidCertificates = YES;
        // 是否在证书域字段中验证域名
        securityPolicy.validatesDomainName = NO;
        httpSessionManager.securityPolicy = securityPolicy;
        //超时时间配置
        httpSessionManager.requestSerializer = [AFJSONRequestSerializer new];
        httpSessionManager.requestSerializer.timeoutInterval = 10.f;
        // 添加 acceptableContentTypes 参数
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:httpSessionManager.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObject:@"text/plain"];
        [acceptableContentTypes addObject:@"text/html"];
        [acceptableContentTypes addObject:@"text/json"];
        [acceptableContentTypes addObject:@"application/json"];
        [acceptableContentTypes addObject:@"application/json,charset=UTF-8"];
        httpSessionManager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    });
    return httpSessionManager;
}

#pragma mark - request method

/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @return 带请求结果（字典）的信号
 */
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params {
    return [self racWithRequestType:requestType URL:url params:params responseType:OPDataResponseTypeDefault clazz:[self class]];
}
/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @return 带请求结果的信号
 */
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType {
    return [self racWithRequestType:requestType URL:url params:params responseType:responseType clazz:[self class]];
}
/**
 响应式请求网络方法
 @param  requestType  http请求的方法类型
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @return 带请求结果的信号
 */
+ (RACSignal *)racWithRequestType:(HTTPRequestType)requestType URL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz {
    if (requestType == HTTPRequestTypeGET) {
        return [self racGETWithURL:url params:params responseType:responseType clazz:clazz headers:nil];
    } else if (requestType == HTTPRequestTypePOST) {
        return [self racPOSTWithURL:url params:params responseType:responseType clazz:clazz headers:nil];
    }
}


+ (void)configCommonHeaders:(NSDictionary<NSString * , NSString *> *)headers responseType:(OPDataResponseType)responseType  {
    // 设置token的值
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:UDTokenKey];
    if(token && !token) {
       [[NetWorkManager sharedNetWorkManager].commonHeaders setObject:token forKey:@"token"];
    }
    // 设置请求序列
    AFHTTPRequestSerializer *httpRequestSerializer = [[AFJSONRequestSerializer alloc] init];
    if (headers) {
        for (NSString *key in headers.allKeys) {
            [httpRequestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    } else if ([NetWorkManager sharedNetWorkManager].commonHeaders) {
        for (NSString *key in [NetWorkManager sharedNetWorkManager].commonHeaders) {
            [httpRequestSerializer setValue:[NetWorkManager sharedNetWorkManager].commonHeaders[key] forHTTPHeaderField:key];
        }
    }
    [[NetWorkManager sharedSessionOperationManager] setRequestSerializer:httpRequestSerializer];
}
/**
 GET请求
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @param  headers      请求自带的请求头
 @return 带请求结果的信号
 */
+ (RACSignal *)racGETWithURL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz headers:(NSDictionary<NSString * , NSString *> *)headers {
    return [[RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        
        AFHTTPSessionManager *httpSessionManager = [self sharedSessionOperationManager];
        NSURLSessionDataTask *task =
        [httpSessionManager GET:url parameters:params headers:[NetWorkManager sharedNetWorkManager].commonHeaders progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handleResultWithSubscriber:(id <RACSubscriber>) subscriber task:task responseObject:responseObject clazz:clazz responseType: responseType];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleErrorResultWithSubscriber:(id <RACSubscriber>) subscriber task:task error:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] setNameWithFormat:@"<%@: %p> -get2racWthURL: %@, params: %@", self.class, self, url, params];
}
/**
 POST请求
 @param  url          请求地址
 @param  params       请求参数
 @param  responseType 请求值返回的类型
 @param  clazz        返回值反序列化的类
 @param  headers      请求自带的请求头
 @return 带请求结果的信号
 */
+ (RACSignal *)racPOSTWithURL:(NSString *)url params:(id)params responseType:(OPDataResponseType)responseType clazz:(Class)clazz headers:(NSDictionary<NSString * , NSString *> *)headers {
    if (!headers) {
        [self configCommonHeaders:headers responseType:responseType];
    }
    return [[RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        
        AFHTTPSessionManager *httpSessionManager = [self sharedSessionOperationManager];
        NSURLSessionDataTask *task =
        [httpSessionManager POST:url parameters:params headers:[NetWorkManager sharedNetWorkManager].commonHeaders progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handleResultWithSubscriber:(id <RACSubscriber>) subscriber task:task responseObject:responseObject clazz:clazz responseType: responseType];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleErrorResultWithSubscriber:(id <RACSubscriber>) subscriber task:task error:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] setNameWithFormat:@"<%@: %p> -post2racWthURL: %@, params: %@", self.class, self, url, params];
}
/**
 处理请求失败返回的信息
 @param  subscriber    subscriber
 @param  task          task
 @param  error         错误信息
 */
+ (void)handleErrorResultWithSubscriber:(id <RACSubscriber>)subscriber task:(NSURLSessionDataTask *)task error:(NSError *)error {
}
/**
 处理请求成功返回的信息
 @param  subscriber     subscriber
 @param  task           task
 @param  responseObject 返回的数据
 @param  clazz          clazz
 @param  reponseType    返回数据类型
 */
+ (void)handleResultWithSubscriber:(id <RACSubscriber>)subscriber task:(NSURLSessionDataTask *)task responseObject:(id)responseObject clazz:(Class) clazz responseType:(OPDataResponseType)reponseType {
    if (reponseType == OPDataResponseTypeNotJson) {
        [subscriber sendNext:[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]];
        [subscriber sendCompleted];
    } else {
        OPDataResponse *opDataResponse = [[OPDataResponse alloc] initWithResponse:responseObject dataModleClass:clazz responseType:reponseType];
        if (opDataResponse.code == CodeTypeSuccess) { // 返回的值成功
            [subscriber sendNext:opDataResponse];
            [subscriber sendCompleted];
        } else if (opDataResponse.code == CodeTypeTokenInvalid) { // token失效
            
        } else if (opDataResponse) { // 其他错误
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[operationInfoKey] = task;
            BOOL isError = opDataResponse || opDataResponse.code != 200;
            NSString * errorInfo = isError ? [responseObject objectForKey:@"msg"] : @"请求没有得到处理";
            userInfo[customErrorInfoKey] = errorInfo;
            userInfo[reponseErrorInfoKey] = opDataResponse;
            NSError * error = [NSError errorWithDomain:nil code:customErrorCode userInfo:userInfo];
            [subscriber sendError:error];
        }
    }
}

@end
