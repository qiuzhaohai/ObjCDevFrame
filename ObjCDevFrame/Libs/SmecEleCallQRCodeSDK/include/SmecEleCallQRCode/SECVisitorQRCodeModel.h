//
//  SECVisitorQRCodeModel.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import "SECFloorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SECVisitorQRCodeModel : NSObject

// 卡片ID
@property(nonatomic, strong)  NSString *cardId;
// 电梯组
@property (nonatomic, strong) NSString *groupId;
// 区域ID
@property (nonatomic, strong) NSString *regionId;
// 来访人姓名
@property (nonatomic, strong) NSString *visitorName;
// 来访起始时间
@property (nonatomic, strong) NSString *validTimeStart;
// 来访结束时间
@property (nonatomic, strong) NSString *validTimeEnd;
// 前门可去楼层
@property (nonatomic, strong) NSArray<SECFloorModel *> *frontAuthFloor;
// 后门可去楼层
@property (nonatomic, strong) NSArray<SECFloorModel *> *backAuthFloor;
// 是否是计次卡
@property (nonatomic, strong) NSString *isTimeCard;
// IC卡剩余可用次数
@property (nonatomic, strong) NSString *remainCount;
// 创建时间
@property (nonatomic, strong) NSString *createTime;

@end

NS_ASSUME_NONNULL_END
