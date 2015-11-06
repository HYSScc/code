//
//  CarGroup.h
//  汽车品牌字典转模型
//
//  Created by tom-pc on 15/10/19.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
/** 首字母 */
@property (nonatomic, copy) NSString *title;
/** 车的数组，存放的是Car的模型数据 */
@property (nonatomic, strong) NSArray *cars;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
+ (NSArray *)carGroups;

@end
