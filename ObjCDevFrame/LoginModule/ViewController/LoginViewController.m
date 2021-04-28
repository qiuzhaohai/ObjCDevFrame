//
//  LoginViewController.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarControllerConfig.h"
#import "AppDelegate.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property(nonatomic) LoginViewModel *loginViewModel;

@property(nonatomic, assign) UIStatusBarStyle style;

@end

@implementation LoginViewController

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginModel *model;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setStatusBarStyleNotificationAction:) name:@"SetStatusBarStyle" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = red_color;
    
    [self.loginViewModel setAccount:@"18650457578"];
    [self.loginViewModel setPassword:@"12345"];
//    // 网络请求
//    [[self.loginViewModel.loginCommond execute:[self.loginViewModel createRequestParams]] subscribeNext:^(id  _Nullable x) {
//
        [self loginToAppMainPage];
        
//    } error:^(NSError * _Nullable error) {
//    }];
}

// 改变导航栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.style ?: UIStatusBarStyleLightContent;
}

- (void)setStatusBarStyleNotificationAction:(NSNotification *)notification  {
    if ([notification.userInfo[@"color"] isEqual:@"light"]) {
        self.style = UIStatusBarStyleLightContent;
    } else {
        self.style = UIStatusBarStyleDarkContent;
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SetStatusBarStyle" object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SetStatusBarStyle" object:self userInfo:@{@"color":@"black"}];
}

#pragma mark - method

- (void)loginToAppMainPage {
    MainTabBarControllerConfig *tabbarConfig  = [[MainTabBarControllerConfig alloc] init];
    CYLTabBarController *mainTabbarController = tabbarConfig.mainTabbarController;
    [mainTabbarController setSelectedIndex:1];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.window setRootViewController:mainTabbarController];
    [appDelegate.window makeKeyAndVisible];
}



#pragma mark - setter/getter

- (LoginViewModel *)loginViewModel {
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

@end
