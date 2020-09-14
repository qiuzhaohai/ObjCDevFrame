//
//  MD5Manager.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/13.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "MD5Manager.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Manager

/**
MD5加密
@param  dataStr 需要加密的字符串
@return 返回加密结果
*/
+ (NSString *)md5Encrypt:(NSString *)dataStr {
    const char *data = [dataStr UTF8String];
    unsigned char md[16];
    CC_MD5(data, (CC_LONG)strlen(data), md);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
           md[0],  md[1],  md[2],  md[3],
           md[4],  md[5],  md[6],  md[7],
           md[8],  md[9],  md[10], md[11],
           md[12], md[13], md[14], md[15]];
}

@end
