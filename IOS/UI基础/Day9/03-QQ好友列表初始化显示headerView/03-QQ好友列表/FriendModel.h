//
//  FriendModel.h
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign, getter=isVip) BOOL vip;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendModelWithDict:(NSDictionary *)dict;
+ (NSArray *)friendModelWithArray:(NSArray *)array;

@end
