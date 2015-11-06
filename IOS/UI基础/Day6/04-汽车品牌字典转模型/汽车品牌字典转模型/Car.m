//
//  Car.m
//  汽车品牌字典转模型
//
//  Created by tom-pc on 15/10/19.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carsWithArray:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carWithDict:dict]];
    }
    return arrayM;
}


@end
