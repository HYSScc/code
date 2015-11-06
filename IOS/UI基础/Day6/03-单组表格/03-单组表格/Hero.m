//
//  Hero.m
//  03-单组表格
//
//  Created by tom-pc on 15/10/17.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)heros
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self heroWithDict:dict]];
    }
    return arrayM;
}


@end
