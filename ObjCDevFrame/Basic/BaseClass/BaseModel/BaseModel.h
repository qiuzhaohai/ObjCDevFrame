//
//  BaseModel.h
//  ObjCDevFrame
//
//  Created by QiuZhaoHai on 2020/9/18.
//  Copyright © 2020 QiuZhaoHai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject<NSCopying, NSCoding>

-(void)encodeWithCoder:(NSCoder *)aCoder;

-(instancetype)initWithCoder:(NSCoder *)aDecoder;

-(id)copyWithZone:(NSZone *)zone;

-(BOOL)isEqual:(id)object;

@end

NS_ASSUME_NONNULL_END
