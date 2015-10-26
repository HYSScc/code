//
//  CarGroup.m
//  汽车品牌字典转模型
//
//  Created by tom-pc on 15/10/19.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
//        [self setValuesForKeysWithDictionary:dict];
        [self setValue:dict[@"title"] forKey:@"title"];
        // dict[@"cars"]存放的是字典数组
        // 希望将字典的数组转换成Car模型的数组
//        [self setValue:dict[@"cars"] forKey:@"cars"];
        self.cars = [Car carsWithArray:dict[@"cars"]];
    }
    return self;
}

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carGroups
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carGroupWithDict:dict]];
    }
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {title: %@, car: %@}", self.class, self, self.title, self.cars];
    
}

@end
