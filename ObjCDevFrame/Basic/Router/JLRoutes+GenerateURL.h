//
//  JLRoutes+GenerateURL.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/14.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <JLRoutes/JLRoutes.h>

#undef JLRGenRoute
#define JLRGenRoute(Schema, path) \
([NSString stringWithFormat: @"%@:/%@", \
Schema, \
path])

#undef JLRGenRouteURL
#define JLRGenRouteURL(Schema, path) \
([NSURL URLWithString: \
JLRGenRoute(Schema, path)])

NS_ASSUME_NONNULL_BEGIN

@interface JLRoutes (GenerateURL)

/**
 避免 URL 散落各处， 集中生成URL
 
 @param pattern 匹配模式
 @param parameters 附带参数
 @return URL字符串
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters;

/**
 避免 URL 散落各处， 集中生成URL
 额外参数将被 ?key=value&key2=value2 样式给出
 
 @param pattern 匹配模式
 @param parameters 附加参数
 @param extraParameters 额外参数
 @return URL字符串
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters extraParameters:(NSDictionary *)extraParameters;

/**
 解析NSURL对象中的请求参数
 http://madao?param1=value1&param2=value2 解析成 @{param1:value1, param2:value2}
 @param URL NSURL对象
 @return URL字符串
 */
+ (NSDictionary *)parseParamsWithURL:(NSURL *)URL;

/**
 将参数对象进行url编码
 将@{param1:value1, param2:value2} 转换成 ?param1=value1&param2=value2
 @param dic 参数对象
 @return URL字符串
 */
+ (NSString *)mapDictionaryToURLQueryString:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
