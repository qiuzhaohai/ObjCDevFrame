//
//  SmecEleCallQRCode.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import "GerneralMacro.h"
#import "SECQRCodeModel.h"
#import "SECAuthListModel.h"
#import "SECVisitorQRCodeModel.h"
#import "SECMemberModel.h"
#import "SECMemberDetailModel.h"

/* SDK版本号 */
#define SECCODE_IOS_SDK_VERSION @"1.0.0"

NS_ASSUME_NONNULL_BEGIN

@interface SmecEleCallQRCode : NSObject

#pragma mark -- SDK 初始化

/**
 *    QRCode 初始化配置
 *
 * @param  appKey          appKey
 * @param  appSecret       appSecret
 * @param  cropId          企业唯一标示
 * @param  callback        回调
 */
+ (void)initWithAppKey:(NSString *_Nonnull)appKey
             appSecret:(NSString *_Nonnull)appSecret
                cropId:(NSString *_Nonnull)cropId
              callback:(CallbackHandler)callback;

#pragma mark -- 账号 API

/**
 * 绑定账号
 *
 * @param  account       账号名
 * @param  callback      回调
 */
+ (void)bindAccount:(NSString *_Nonnull)account callback:(CallbackHandler)callback;

/**
 * 解绑账号
 *
 * @param  callback      回调
 */
+ (void)unbindWithCallback:(CallbackHandler)callback;

#pragma mark -- 乘梯二维码

/**
 * 获取某一业主二维码数据下的访客二维码列表
 * 如果有网络情况下，就网络请求数据； 如果无网络情况下用本地缓存
 *
 * @param  qrCodeModel   qrCodeModel
 * @param  callback      回调
 */
+ (void)getVisitorQRCodeList:(SECQRCodeModel *_Nonnull)qrCodeModel callback:(CallbackHandler)callback;

/**
 * 获取业主二维码列表
 *
 * @return 返回业主二维码数据列表
 */
+ (NSArray<SECQRCodeModel *> *)getQRCodeList;

/**
 * 生成访客二维码
 *
 * @param  visitorQRCodeModel 访客二维码数据
 * @return 返回访客二维码
 */
+ (NSString *)makeVisitorQRCodeWithVisitorQRCodeModel:(SECVisitorQRCodeModel *_Nonnull)visitorQRCodeModel;

/**
 * 生成业主二维码
 *
 * @param  qrCodeModel    业主二维码数据
 * @return 返回业主二维码
 */
+ (NSString *)makeQRCodeWithQRCodeModel:(SECQRCodeModel *_Nonnull)qrCodeModel;

/**
 * 刷新业主二维码
 *
 * @param  qrCodeModel    业主二维码数据
 * @return 返回业主二维码
 */
+ (NSString *)refreshQRCodeWithQRCodeModel:(SECQRCodeModel *_Nonnull)qrCodeModel;

/**
 * 更新本地业主二维码列表数据
 *
 * @param  callback       回调
 */
+ (void)updateQRCodeListWithCallback:(CallbackHandler)callback;

#pragma mark -- 成员管理 API

/**
 * 获取成员信息列表
 *
 * @param  callback      返回信息
 */
+ (void)getMemberListWithCallback:(CallbackHandler)callback;

/**
 * 删除成员
 *
 * @param  memberModel   memberModel
 * @param  callback      回调
 */
+ (void)deleteMemberWithMemberModel:(SECMemberModel *_Nonnull)memberModel callback:(CallbackHandler)callback;

/**
 * 获取楼层权限列表
 *
 * @param  callback        回调
 */
+ (void)getAuthFloorsWithCallback:(CallbackHandler)callback;

/**
 * 获取成员详情
 *
 * @param  memberModel   memberModel
 * @param  callback        回调
 */
+ (void)getMemberDetailWithMemberModel:(SECMemberModel *_Nonnull)memberModel callback:(CallbackHandler)callback;


/**
 * 申请成员信息
 *
 * @param  phoneNumber   电话号码
 * @param  memberType    成员类型
 * @param  remark        备注信息
 * @param  authList      授权的楼层权限列表
 * @param  callback      回调
 */
+ (void)addMemberWithPhoneNumber:(NSString *_Nonnull)phoneNumber
                      memberType:(NSString *_Nonnull)memberType
                      memberName:(NSString *_Nonnull)memberName
                          remark:(NSString *_Nonnull)remark
                        authList:(NSMutableArray<SECAuthListModel *> *_Nonnull)authList
                        callback:(CallbackHandler)callback;

/**
 * 校验成员号码
 * 校验成功后会返回成员姓名
 *
 * @param  memberPhone   成员电话
 * @param  callback      回调
 */
+ (void)checkMemberPhone:(NSString *_Nonnull)memberPhone callback:(CallbackHandler)callback;

/**
 * 成员信息推送
 *
 */

/**
 * 获取SDK版本
 *
 * @return SDK版本
 */
+ (NSString *)getVersion;

@end
NS_ASSUME_NONNULL_END
