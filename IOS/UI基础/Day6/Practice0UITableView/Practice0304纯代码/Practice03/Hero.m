//
//  Hero.m
//  Practice03
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        //KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroModelWithDict:(NSDictionary *)dict
{
    return [[Hero alloc] initWithDict:dict];
}

+ (NSArray *)heroModel
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self heroModelWithDict:dict]];
    }
    return arrayM;
}

@end
