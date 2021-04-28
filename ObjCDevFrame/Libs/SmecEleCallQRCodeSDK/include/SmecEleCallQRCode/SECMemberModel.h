//
//  SECMemberModel.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SECMemberModel : NSObject


/// 成员名称
@property (nonatomic, strong) NSString * userName;
/// 电话
@property (nonatomic, strong) NSString * userCode;
/// 性别
@property (nonatomic, strong) NSString * userSex;
/// 地址
@property (nonatomic, strong) NSString * userAddress;
/// 详细地址
@property (nonatomic, strong) NSString * userDetailAddress;
/// 图片uuid
@property (nonatomic, strong) NSString * attachmentId;
/// 图片的url
@property (nonatomic, strong) NSString * url;

@property (nonatomic, strong) NSString * agreementId;

@property (nonatomic, strong) NSString * groupRegion;
/// 用户区域
@property (nonatomic, strong) NSString * userArea;


@end

NS_ASSUME_NONNULL_END
