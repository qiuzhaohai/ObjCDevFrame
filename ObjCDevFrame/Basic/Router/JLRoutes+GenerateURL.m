//
//  JLRoutes+GenerateURL.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/14.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "JLRoutes+GenerateURL.h"
#import <JLRoutes/JLRRouteRequest.h>
#import <JLRoutes/JLRRouteDefinition.h>
#import <JLRoutes/JLRParsingUtilities.h>

@implementation JLRoutes(GenerateURL)

/**
 避免 URL 散落各处， 集中生成URL
 
 @param pattern 匹配模式
 @param parameters 附带参数
 @return URL字符串
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters
{
    return [[self class] generateURLWithPattern:pattern parameters:parameters extraParameters:nil];
}
/**
 避免 URL 散落各处， 集中生成URL
 额外参数将被 ?key=value&key2=value2 样式给出
 
 @param pattern 匹配模式
 @param parameters 附加参数
 @param extraParameters 额外参数
 @return URL字符串
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters extraParameters:(NSDictionary *)extraParameters
{
    // 创建路由
    JLRRouteDefinition *route = [[JLRRouteDefinition alloc] initWithPattern:pattern priority:0 handlerBlock:^BOOL(NSDictionary * _Nonnull parameters) {
        return NO;
    }];
    NSArray *patternComponents;
    @try {
        patternComponents = route.patternPathComponents;
    } @catch (NSException *exception) {
        return nil;
    } @finally {
    }
    
    NSUInteger index = 0;
    NSMutableArray *routeValues = [NSMutableArray array];
    for (NSString *patternComponent in patternComponents) {
        
        NSString *URLComponent = nil;
        if (index < [parameters count]) {
            URLComponent = parameters[index];
        } else if ([patternComponent isEqualToString:@"*"]) {
            // match /foo by /foo/*
            URLComponent = [parameters lastObject];
        }
        
        if ([patternComponent hasPrefix:@":"]) {
            // 匹配到了一个值
            @try {
                NSString *variableValue = [JLRParsingUtilities variableValueFrom:[route routeVariableValueForValue:URLComponent] decodePlusSymbols:NO];
                [routeValues addObject:variableValue];
            } @catch (NSException *exception) {
            }
            index++;
        } else if ([patternComponent isEqualToString:@"*"]){
            // 模糊匹配
            NSUInteger minRequiredParams = index;
            if (parameters.count >= minRequiredParams) {
                // match: /a/b/c/* has to be matched by at least /a/b/c
                [routeValues addObjectsFromArray:[parameters subarrayWithRange:NSMakeRange(index, parameters.count - index)]];
            }
        } else {
            // 静态参数值
            [routeValues addObject:patternComponent];
        }
    }
    
    if (routeValues && routeValues.count) {
        
        NSString *urlPath = [routeValues componentsJoinedByString:@"/"];
        return [NSString stringWithFormat:@"/%@%@", urlPath, [self mapDictionaryToURLQueryString:extraParameters]];
    }
    return nil;
}
/**
 解析NSURL对象中的请求参数
 http://madao?param1=value1&param2=value2 解析成 @{param1:value1, param2:value2}
 @param URL NSURL对象
 @return URL字符串
 */
+ (NSDictionary *)parseParamsWithURL:(NSURL *)URL
{
    NSString *parameterString = URL.query;
    NSMutableDictionary *parameterDic = [NSMutableDictionary new];
    if (parameterString && parameterString.length > 0) {
        
        NSArray *kvPart = [parameterString componentsSeparatedByString:@"&"];
        for (NSString * kv in kvPart) {
            
            NSArray *kvArr = [kv componentsSeparatedByString:@"="];
            if (kvArr.count == 2) {
                
                [parameterDic setObject:[kvArr lastObject] forKey:[kvArr firstObject]];
            }
        }
        
    }
    return [NSDictionary dictionaryWithDictionary:parameterDic];
}
/**
 将参数对象进行url编码
 将@{param1:value1, param2:value2} 转换成 ?param1=value1&param2=value2
 @param dic 参数对象
 @return URL字符串
 */
+ (NSString *)mapDictionaryToURLQueryString:(NSDictionary *)dic
{
    if (!dic) {
        return @"";
    }
    NSURLComponents *components = [[NSURLComponents alloc] init];
    NSMutableArray *queryItems = [NSMutableArray array];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *queryKey = [NSString stringWithFormat:@"%@", key];
        NSString *queryValue = [NSString stringWithFormat:@"%@", obj];
        NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:queryKey value:queryValue];
        [queryItems addObject:item];
    }];
    components.queryItems = [queryItems copy];
    
    return components.URL.absoluteString;
}

@end
