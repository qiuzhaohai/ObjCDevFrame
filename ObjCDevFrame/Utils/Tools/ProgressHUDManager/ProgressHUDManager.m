//
//  ProgressHUDManager.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/26.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "ProgressHUDManager.h"
@implementation ProgressHUDManager


/// ProgressHUD 全局配置
+ (void)configProgressHUDWithCornerRadius:(CGFloat)cornerRadius styleType:(SVProgressHUDStyle)styleType animationType:(SVProgressHUDAnimationType)animationType {
    [SVProgressHUD setCornerRadius:cornerRadius];
    // 设置样式类型
    [SVProgressHUD setDefaultStyle:styleType];
    [SVProgressHUD setDefaultAnimationType:animationType];
}

/// 关闭
+ (void)closeProgressHUD {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}

/// 显示loading
/// @param text 文本
+ (void)showLoadingHUDWithText:(NSString *)text {
    [ProgressHUDManager closeProgressHUD];
    
    if (text) {
        [SVProgressHUD showWithStatus:text];
    } else {
        [SVProgressHUD show];
    }
}

/// 显示文本提示
/// @param text 提示文本
+ (void)showTextHUD:(NSString *)text {
    [ProgressHUDManager closeProgressHUD];
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:text];
    [SVProgressHUD dismissWithDelay:2];
}


/// 显示Completion带文本
/// @param text 文本
/// @param completion Completion
+ (void)showCompletionHUDWithText:(NSString *)text completion:(completeAction)completion {
    [ProgressHUDManager closeProgressHUD];
    [SVProgressHUD dismissWithDelay:2];
    
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
}


/// 显示警告提示
/// @param text 文本
/// @param completion Completion
+ (void)showWarningHUDWithText:(NSString *)text completion:(completeAction)completion {
    [ProgressHUDManager closeProgressHUD];
    [SVProgressHUD showErrorWithStatus:text];
    [SVProgressHUD dismissWithDelay:2];
    
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

@end
