//
//  CZAppsModel.m
//  Cell的重用
//
//  Created by S.J on 14-8-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZAppsModel.h"

@implementation CZAppsModel

+ (instancetype)appsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}


@end
