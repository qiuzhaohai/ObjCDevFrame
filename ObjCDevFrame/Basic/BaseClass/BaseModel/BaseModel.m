//
//  BaseModel.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/18.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "BaseModel.h"
#import "NSObject+YYModel.h"

@implementation BaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self modelInitWithCoder:aDecoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self modelCopy];
}

- (BOOL)isEqual:(id)object {
    return [self modelIsEqual:object];
}

@end
