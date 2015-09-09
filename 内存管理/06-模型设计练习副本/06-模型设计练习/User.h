//
//  User.h
//  06-模型设计练习
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SexMan,
    SexWoman
} Sex;

typedef struct {
    int year;
    int month;
    int day;
} Date;
// 姓名、微博号码、密码、头像、性别、手机、生日

@interface User : NSObject
@property ( strong, nonatomic) NSString *name;
@property ( nonatomic, strong) NSString *account;
@property ( nonatomic, strong) NSString *password;
@property ( nonatomic, strong) NSString *icon;
@property ( nonatomic, assign) Sex sex;
@property ( nonatomic, strong) NSString *phone;
@property ( nonatomic, assign) Date birthday;
@end
