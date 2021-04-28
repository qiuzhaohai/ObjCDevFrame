//
//  LoginViewModel.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/4/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property(nonatomic) RACCommand *loginCommond;

@property(nonatomic) LoginModel *loginModel;

- (void)setAccount:(NSString *)value;
- (void)setPassword:(NSString *)value;
- (NSDictionary *)createRequestParams;
@end

NS_ASSUME_NONNULL_END
