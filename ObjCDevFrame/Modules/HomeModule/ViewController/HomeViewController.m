//
//  HomeViewController.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/8.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewController.h"
#import "MD5Manager.h"

#import "LoginViewController.h"
#import "YYFPSLabel.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    // 路由跳转
//    NSString *router = [JLRoutes generateURLWithPattern:NavPushRoute parameters:@[NSStringFromClass(LoginViewController.class)]];
//    [[RACScheduler mainThreadScheduler] schedule:^{
//        [JLRoutes routeURL:JLRGenRouteURL(DefaultRouteSchema, router)];
//    }];
}

@end
