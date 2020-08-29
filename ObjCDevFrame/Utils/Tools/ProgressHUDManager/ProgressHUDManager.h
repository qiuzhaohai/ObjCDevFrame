//
//  ProgressHUDManager.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/3/26.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^__nullable completeAction)(void);

@interface ProgressHUDManager : NSObject

+ (void)configProgressHUDWithCornerRadius:(CGFloat)cornerRadius style:(SVProgressHUDStyle)style animationType:(SVProgressHUDAnimationType)animationType;
+ (void)closeProgressHUD;
+ (void)showLoadingHUDWithText:(NSString *)text;
+ (void)showTextHUD:(NSString *)text;
+ (void)showCompletionHUDWithText:(NSString *)text completion:(completeAction)completion;
+ (void)showWarningHUDWithText:(NSString *)text completion:(completeAction)completion;

@end

NS_ASSUME_NONNULL_END
