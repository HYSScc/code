//
//  FriendGroup.m
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "FriendGroup.h"
#import "FriendModel.h"
@implementation FriendGroup
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
        self.friends = [FriendModel friendModelWithArray:self.friends];
    }
    return self;
}

+ (instancetype)friendGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)friendGroup
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self friendGroupWithDict:dict]];
    }
    return arrayM;
}

@end
