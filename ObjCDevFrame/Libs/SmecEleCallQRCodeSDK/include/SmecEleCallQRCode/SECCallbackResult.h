//
//  SECCallbackResult.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SECCallbackResult : NSObject

@property(nonatomic, readonly) BOOL success;

@property(nonatomic, readonly, nullable) id data;

@property(nonatomic, readonly, nullable) NSError *error;

- (nonnull instancetype)initWithData:(nullable id)data;

- (nonnull instancetype)initWithError:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
