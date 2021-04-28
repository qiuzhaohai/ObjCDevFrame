//
//  RegularMatchManager.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/26.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "RegularMatchManager.h"

@implementation RegularMatchManager
+ (BOOL)regularMatchValue:(NSString *)value RegexExpr:(NSString *)RegexExpr {
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", RegexExpr] evaluateWithObject:value];
}

@end
