//
//  LoginModel.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/4/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginModel : BaseModel

/// 账号
@property(nonatomic) NSString *account;
/// 密码
@property(nonatomic) NSString *password;
/// 验证码
@property(nonatomic) NSString *verificationCode;
/// 是否密码登录
@property(nonatomic, assign) BOOL isPwdLogin;
/// 登录类型
@property(nonatomic) NSString *loginType;

@end

NS_ASSUME_NONNULL_END
