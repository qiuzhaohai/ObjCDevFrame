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

@implementation LoginViewModel

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



@end
