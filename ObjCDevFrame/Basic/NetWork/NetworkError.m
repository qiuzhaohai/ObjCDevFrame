//
//  NetworkError.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/12.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "NetworkError.h"

@implementation NetworkError
/**
 处理网络请求错误信息
 */
+ (NSString *)handleErrorMessage:(NSError *)error
{
    NSString * result = nil;
    switch (error.code) {
        case kCFURLErrorTimedOut://-1001
            result = @"服务器连接超时";
            break;
        case kCFURLErrorBadServerResponse://-1011
            result = @"请求无效";
            break;
        case kCFURLErrorNotConnectedToInternet: //-1009 似乎已断开与互联网的连接
        case kCFURLErrorCannotDecodeContentData://-1016 cmcc 解析数据失败
            result = @"网络好像断开了...";
            break;
        case kCFURLErrorCannotFindHost: //-1003 未能找到使用指定主机名的服务器
            result = @"服务器内部错误";
            break;
        case kCFURLErrorNetworkConnectionLost: //-1005
            result = @"网络连接已中断";
            break;
        default:
            result = @"其他错误";
            break;
    }
    
    return result;
}

@end
