//
//  FriendGroup.h
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FriendGroup : NSObject
// 组名
@property (nonatomic, copy) NSString *name;
// 友源函数 friend 是c++的关键字
@property (nonatomic, strong) NSArray *friends;
// 在线人数
@property (nonatomic, assign) int online;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDict:(NSDictionary *)dict;
+ (NSArray *)friendGroup;

@property (nonatomic, assign) BOOL open;
@end
