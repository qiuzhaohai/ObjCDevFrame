//
//  OPDataResponse.m
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/13.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import "OPDataResponse.h"
#import "YYModel.h"

@implementation OPDataResponse

/**
 初始化应答的数据
 @param response 应答的数据
 */
- (instancetype)initWithResponse:(id)response dataModleClass:(Class)dataModelClass responseType:(OPDataResponseType)responseType {
    self = [super init];
    @try {
        self.code = [response[@"code"] integerValue];
        if (dataModelClass == nil) {
            self.data = response[@"data"];
        } else {
            if (responseType == OPDataResponseTypeDefault) {
                self.data = [dataModelClass modelWithDictionary:response[@"data"]];
            } else if (responseType == OPDataResponseTypeList) {
                self.data = [NSArray modelArrayWithClass:dataModelClass json:response[@"data"]];
            } else if (responseType == OPDataResponseTypePage) {
//                self.page = [response[@"page"] integerValue];
//                self.size = [response[@"size"] integerValue];
//                self.data = [NSArray modelArrayWithClass:dataModelClass json:response[@"data"]];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return self;
}
@end
