//
//  Status.h
//  06-模型设计练习
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

// 微博内容、微博配图、发送时间、微博发送人、转发的微博、被评论数、被转发数

@interface Status : NSObject
@property ( nonatomic, retain) NSString *text;
@property ( nonatomic, retain) NSString *icon;

// 从1970-01-01 00:00:00 开始，一共度过了多少毫秒
@property ( nonatomic, assign) long time;
//@property ( nonatomic, assign) time_t time;

@property ( nonatomic, retain) User *user;

@property ( nonatomic, retain) Status *retweetStatus ;

@property ( nonatomic, assign) int commentsCount;
@property ( nonatomic, assign) int retweetsCount;

@end
