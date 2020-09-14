//
//  LoginViewModel.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/4/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy) NSString *accout;
@property(nonatomic, copy) NSString *verificationCode;

@property(nonatomic) RACCommand *loginCommond;

@end

NS_ASSUME_NONNULL_END
