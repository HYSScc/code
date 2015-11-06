//
//  MessageModel.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init]; // 调用父类
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageModelWithDict:(NSDictionary *)dict
{
    return [[MessageModel alloc] initWithDict:dict];
}

@end
