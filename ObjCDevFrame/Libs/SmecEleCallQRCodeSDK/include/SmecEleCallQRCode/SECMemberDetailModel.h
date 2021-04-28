//
//  SECMemberDetailModel.h
//  SmecEleCallQRCode
//
//  Created by QiuZhaoHai on 2020/11/9.
//

#import <Foundation/Foundation.h>
#import "SECFloorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SECMemberDetailModel : NSObject
// 卡片名称
@property(nonatomic, strong)  NSString *cardName;
// 卡片ID
@property (nonatomic, strong) NSString *cardId;
// 电梯组
@property (nonatomic, strong) NSString *groupId;
// 区域ID
@property (nonatomic, strong) NSString *regionId;
// 用户类型
@property (nonatomic, strong) NSString *userType;
// 电梯组名
@property (nonatomic, strong) NSString *groupName;
// 楼层权限列表
@property (nonatomic, strong) NSMutableArray<SECFloorModel *> *floorSet;

@end

NS_ASSUME_NONNULL_END
