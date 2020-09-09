//
//  MainTabBarControllerConfig.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/3.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "MainTabBarControllerConfig.h"
#import "RTRootNavigationController.h"
#import "MessageViewController.h"
#import "HomeViewController.h"
#import "MeViewController.h"

@interface MainTabBarControllerConfig()<CYLTabBarControllerDelegate>

@end

@implementation MainTabBarControllerConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 设置tabbar样式
        [self setTabBarAppearance:_mainTabbarController];
    }
    return self;
}

#pragma mark - setter/getter

- (CYLTabBarController *)mainTabbarController {
    
    if (!_mainTabbarController) {
        
        _mainTabbarController = [CYLTabBarController tabBarControllerWithViewControllers:[self getViewControllerItems] tabBarItemsAttributes:[self getTabBarItemsAttributes]];
    }
    return _mainTabbarController;
}

/**
* TabBarItemsAttributes获取
* @return TabBarItemsAttributes
*/
- (NSArray *)getTabBarItemsAttributes {
    
    // 消息页面
    NSDictionary *messageItemAttributes = @{
        CYLTabBarItemTitle: NSLocalizedString(@"Message", nil),
        CYLTabBarItemImage: @"icon_tabbar_message",
        CYLTabBarItemSelectedImage: @"icon_tabbar_message_highlight"
    };
    // 首页
    NSDictionary *homeItemAttributes = @{
        CYLTabBarItemTitle: NSLocalizedString(@"Home", nil),
        CYLTabBarItemImage: @"icon_tabbar_home",
        CYLTabBarItemSelectedImage: @"icon_tabbar_home_highlight"
    };
    // 我的
    NSDictionary *meItemAttributes = @{
        CYLTabBarItemTitle: NSLocalizedString(@"Me", nil),
        CYLTabBarItemImage: @"icon_tabbar_me",
        CYLTabBarItemSelectedImage: @"icon_tabbar_me_highlight"
    };
    return @[messageItemAttributes, homeItemAttributes, meItemAttributes];
}

/**
 * ViewControllerItems获取
 * @return ViewControllerItems
 */
- (NSArray *)getViewControllerItems {
    
    // 消息页面
    RTRootNavigationController *messageViewController = [[RTRootNavigationController alloc] initWithRootViewControllerNoWrapping:
                                                         [[MessageViewController alloc] init]];
    // 首页
    RTRootNavigationController *homeViewController    = [[RTRootNavigationController alloc] initWithRootViewControllerNoWrapping:
                                                         [[HomeViewController alloc] init]];
    // 个人界面
    RTRootNavigationController *meViewController      = [[RTRootNavigationController alloc] initWithRootViewControllerNoWrapping:
                                                         [[MeViewController alloc] init]];
    return @[messageViewController, homeViewController, meViewController];
}

/**
 *  TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 *  @prams tabBarController
 */
- (void)setTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = UITabBarAppearance.new;
        // 正常显示颜色
        UITabBarItemStateAppearance *normal = appearance.stackedLayoutAppearance.normal;
        if (normal)
            normal.titleTextAttributes = @{NSForegroundColorAttributeName:TABBAR_UNSELECT};
        // 选中显示颜色
        UITabBarItemStateAppearance *selected = appearance.stackedLayoutAppearance.selected;
        if (selected)
            selected.titleTextAttributes = @{NSForegroundColorAttributeName:TABBAR_SELECTED};
        tabBarController.tabBar.standardAppearance = appearance;
    } else {
        UITabBarItem *tabBarItem = [UITabBarItem appearance];
        // 正常显示颜色
        NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
        normalAttrs[NSForegroundColorAttributeName] = TABBAR_UNSELECT;
        [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        // 选中显示颜色
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSForegroundColorAttributeName] = TABBAR_SELECTED;
        [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    }
    
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
}


@end
