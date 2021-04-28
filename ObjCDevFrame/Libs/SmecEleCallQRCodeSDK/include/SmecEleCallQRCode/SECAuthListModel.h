//
//  SECAuthListModel.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import "SECFloorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SECAuthListModel : NSObject

// 卡片名称
@property (nonatomic, strong) NSString *cardName;
// 卡片ID
@property (nonatomic, strong) NSString *cardId;
// 电梯组ID
@property (nonatomic, strong) NSString *groupId;
// 电梯组名
@property (nonatomic, strong) NSString *groupName;
// 区域ID
@property (nonatomic, strong) NSString *regionId;
// 用户类型
@property (nonatomic, strong) NSString *userType;
// 前后门可用楼层权限
@property (nonatomic, strong) NSMutableArray<SECFloorModel *> *frontFloor;
@property (nonatomic, strong) NSMutableArray<SECFloorModel *> *backFloor;
// 前后门去重后的楼层权限集合
@property (nonatomic, strong) NSMutableArray<SECFloorModel *> *floorSet;

@end

NS_ASSUME_NONNULL_END
