//
//  LoginViewController.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property(nonatomic) LoginViewModel *loginViewModel;

@end

@implementation LoginViewController

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = red_color;
    // 网络请求
//    NSMutableDictionary *val = [NSMutableDictionary dictionary];
//    [val setValue:@"18650457578" forKey:@"userCode"];
//    [val setValue:[MD5Manager md5Encrypt:@"123456"] forKey:@"password"];
//    [val setValue:@"mpl" forKey:@"loginType"];
//    [[self.loginViewModel.loginCommond execute:val] subscribeNext:^(id  _Nullable x) {
//    } error:^(NSError * _Nullable error) {
//
//    } completed:^{
//    }];
}



#pragma mark - setter/getter

- (LoginViewModel *)loginViewModel {
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

@end
