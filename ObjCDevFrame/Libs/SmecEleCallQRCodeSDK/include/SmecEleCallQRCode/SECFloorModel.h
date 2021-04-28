//
//  SECFloorModel.h
//  Pods-SmecEleCallQRCode_Example
//
//  Created by QiuZhaoHai on 2020/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SECFloorModel : NSObject
/// 虚拟楼层
@property (nonatomic, strong) NSString * floorV;
/// 真实楼层
@property (nonatomic, strong) NSString * floorR;
/// 用户类型
@property (nonatomic, strong) NSString * userType;
/// 合同号梯号列表
@property (nonatomic, strong) NSArray<NSString *>  * contractNo;

@end

NS_ASSUME_NONNULL_END
