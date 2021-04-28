//
//  LoginModel.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/4/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isPwdLogin = YES;
        _loginType  = @"mpl";
    }
    return self;
}

@end
