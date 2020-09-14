//
//  MD5Manager.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/13.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MD5Manager : NSObject

/**
 MD5加密
 @param  dataStr 需要加密的字符串
 @return 返回加密结果
 */
+ (NSString *)md5Encrypt:(NSString *)dataStr;

@end

NS_ASSUME_NONNULL_END
