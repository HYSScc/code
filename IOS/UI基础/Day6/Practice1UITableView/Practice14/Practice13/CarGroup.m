//
//  CarGroup.m
//  Practice13
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValue:dict[@"title"] forKey:@"title"];
        self.cars = [Car carModelWithArray:dict[@"cars"]];
    }
    return self;
}

+ (instancetype)carGroupModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carGroup
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carGroupModelWithDict:dict]];
    }
    return arrayM;
}
@end
