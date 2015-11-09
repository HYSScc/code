//
//  FriendModel.m
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)friendModelWithArray:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self friendModelWithDict:dict]];
    }
    return arrayM;
}
@end
