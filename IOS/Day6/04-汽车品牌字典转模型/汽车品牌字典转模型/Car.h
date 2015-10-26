//
//  Car.h
//  汽车品牌字典转模型
//
//  Created by tom-pc on 15/10/19.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carWithDict:(NSDictionary *)dict;

// 传人一个包含字典的数组，返回一个Car模型的数组
+ (NSArray *)carsWithArray:(NSArray *)array;
@end
