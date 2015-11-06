//
//  MicroblogStatusModel.m
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MicroblogStatusModel.h"

@implementation MicroblogStatusModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)microblogModelWithDict:(NSDictionary *)dict
{
    return [[MicroblogStatusModel alloc] initWithDict:dict];
}

@end
