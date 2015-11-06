//
//  GroupBuyingModel.m
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "GroupBuyingModel.h"

@implementation GroupBuyingModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)groupBuyingModelWithDict:(NSDictionary *)dict
{
    return [[GroupBuyingModel alloc] initWithDict:dict];
}

+ (NSMutableArray *)groupBuyingModel
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self groupBuyingModelWithDict:dict]];
    }
    return arrayM;
}
@end
