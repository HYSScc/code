//
//  App.m
//  Practice01
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "App.h"

@implementation App
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // 原始
//        self.name = dict[@"name"];
//        self.icon = dict[@"icon"];
        // KVC
//        [self setValue:dict[@"name"] forKeyPath:@"name"];
//        [self setValue:dict[@"icon"] forKeyPath:@"icon"];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appModel
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self appModelWithDict:dict]];
    }
    return arrayM;
}

@end
