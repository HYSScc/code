//
//  FlagModel.m
//  02-国旗自定义UIPickerView
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "FlagModel.h"

@implementation FlagModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)flagModel
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self flagWithDict:dict]];
    }
    return arrayM;
}

@end
