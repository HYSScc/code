//
//  ProvinceModel.m
//  03-省市联动
//
//  Created by tom-pc on 15/11/11.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
