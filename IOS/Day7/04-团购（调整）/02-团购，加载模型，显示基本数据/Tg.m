//
//  Tg.m
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "Tg.h"

@implementation Tg
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)tgs
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self tgWithDict:dict]];
    }
    return arrayM;
}

@end
