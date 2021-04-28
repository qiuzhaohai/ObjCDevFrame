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
#import "HomeViewModel.h"

@interface HomeViewController ()
@property(nonatomic, strong) HomeViewModel *homeViewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

- (HomeViewModel *)homeViewModel {
    if (_homeViewModel) return _homeViewModel;
    _homeViewModel = [[HomeViewModel alloc] init];
    return _homeViewModel;
}


@end
