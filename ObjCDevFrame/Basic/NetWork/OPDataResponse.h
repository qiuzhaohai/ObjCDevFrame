//
//  OPDataResponse.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/13.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, OPDataResponseType) {
    OPDataResponseTypeDefault,  // {"code":"success","data":{}}
    OPDataResponseTypeList,     // {"code":"success","data":[]}
    OPDataResponseTypePage,     // {"code":"success","data":[], "page":1, "size":10 , "total": 20}
    OPDataResponseTypeNotJson
};

typedef NS_ENUM(NSUInteger, CodeType) {
    CodeTypeSuccess = 200,
    CodeTypeTokenInvalid = 600
};

static NSString *const operationInfoKey    = @"operationInfoKey";
static NSInteger const customErrorCode     = -90001;
static NSString *const customErrorInfoKey  = @"customErrorInfoKey";
static NSString *const reponseErrorInfoKey = @"reponseErrorInfoKey";

@interface OPDataResponse : NSObject

@property(nonatomic, assign) NSInteger code;  //200 302 304成功，其他都是失败
@property(nonatomic, strong) id        data;
@property(nonatomic, strong) NSError   *error;


- (instancetype)initWithResponse:(id)response dataModleClass:(Class)dataModelClass responseType:(OPDataResponseType)responseType;

@end

NS_ASSUME_NONNULL_END
