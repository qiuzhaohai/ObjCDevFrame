//
//  GerneralMacro.h
//  Pods
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#ifndef GerneralMacro_h
#define GerneralMacro_h

#import "SECCallbackResult.h"

typedef void (^CallbackHandler)(SECCallbackResult *res);

// 保证callback不为空且回调不在主线程上执行
#define NotNilCallback(funcName, paras)\
if (funcName) {\
    if ([NSThread isMainThread]) {\
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\
            funcName(paras);\
        });\
    } else {\
        funcName(paras);\
    }\
}

#endif /* GerneralMacro_h */
