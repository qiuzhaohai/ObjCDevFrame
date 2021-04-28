//
//  SECQRCodeModel.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import "SECFloorModel.h"
#import "SECVisitorQRCodeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SECQRCodeModel : NSObject

// 区域ID
@property (nonatomic, strong) NSString * regionId;
// 卡片ID
@property (nonatomic, strong) NSString * cardId;
// 电梯组
@property (nonatomic, strong) NSString * groupId;
// 父卡片ID
@property (nonatomic, strong) NSString * parentCardId;
// 电梯组名
@property (nonatomic, strong) NSString * groupName;
// 卡片名称
@property (nonatomic, strong) NSString * cardName;
// 用户类型
@property (nonatomic, strong) NSString * userType;
//卡片类型
@property (nonatomic, strong) NSString * cardType;
// 前门可去楼层权限
@property (nonatomic, strong) NSArray<SECFloorModel *> * frontDoorToFloors;
// 前门可去楼层权限
@property (nonatomic, strong) NSArray<SECFloorModel *> * backDoorToFloors;
// 权限状态
@property (nonatomic, strong) NSString * authStatus;
@property (nonatomic, strong) NSString * disableFlag;
// 有效时间开始
@property (nonatomic, strong) NSString * validityPeriodBegin;
// 有效时间结束
@property (nonatomic, strong) NSString * validityPeriodEnd;
// 可用次数
@property (nonatomic, strong) NSString * remainCount;
// 是否计次
@property (nonatomic, strong) NSString * isCount;
// 是否有蓝牙功能
@property (nonatomic, strong) NSString * isBlue;
// 是否有二维码功能
@property (nonatomic, strong) NSString * isQr;
// 是否有NFC功能
@property (nonatomic, strong) NSString * isNfc;

@property (nonatomic, strong) NSString * createDate;
@property (nonatomic, strong) NSString * createBy;
@property (nonatomic, strong) NSString * lastUpdateBy;
@property (nonatomic, strong) NSString * lastUpdateDate;
// 卡片封面udid
@property (nonatomic, strong) NSString * attachmentId;
// 卡片封面下载地址
@property (nonatomic, strong) NSString * downloadUrl;
// 卡片封面名称
@property (nonatomic, strong) NSString * attachmentName;
// 合同号集合
@property (nonatomic, strong) NSArray<NSString *>  * contractNo;

@end

NS_ASSUME_NONNULL_END
