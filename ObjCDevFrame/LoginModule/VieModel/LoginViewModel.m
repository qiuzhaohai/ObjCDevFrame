//
//  LoginViewModel.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/4/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "LoginViewModel.h"
#import "NetWorkManager.h"
#import "OPDataResponse.h"
#import "MD5Manager.h"

@implementation LoginViewModel

#pragma mark - setting/getting
// 登录网络请求
- (RACCommand *)loginCommond {
    if (!_loginCommond) {
        @weakify(self);
        _loginCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id params) {
            return [[NetWorkManager racWithRequestType:HTTPRequestTypePOST URL:USER_LOGIN params:params responseType:OPDataResponseTypeList clazz:nil] map:^id _Nullable(OPDataResponse *response) {
                return response;
            }];
        }];
    }
    return _loginCommond;
}

- (LoginModel *)loginModel {
    if (!_loginModel) {
        _loginModel = [[LoginModel alloc] init];
    }
    return _loginModel;
}

#pragma mark -

- (void)setAccount:(NSString *)value {
    self.loginModel.account = value;
}
- (void)setPassword:(NSString *)value {
    self.loginModel.password = value;
}
- (void)setIsPwdLogin {
    self.loginModel.isPwdLogin = !self.loginModel.isPwdLogin;
    self.loginModel.loginType  = self.loginModel.isPwdLogin ? @"mpl" : @"cpl";
}

- (NSDictionary *)createRequestParams {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.loginModel.isPwdLogin) {
        [params setValue:[MD5Manager md5Encrypt:self.loginModel.password]forKey:@"password"];
    } else {
        [params setValue:self.loginModel.verificationCode forKey:@"verificationCode"];
    }
     [params setValue:self.loginModel.account forKey:@"userCode"];
     [params setValue:self.loginModel.loginType forKey:@"loginType"];
    return params;
}

@end
