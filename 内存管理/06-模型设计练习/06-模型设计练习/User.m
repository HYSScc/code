//
//  User.m
//  06-模型设计练习
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "User.h"

@implementation User
- (void)dealloc
{
    [_name release];
    [_account release];
    [_password release];
    [_icon release];
    [_phone release];
    
    [super dealloc];
}
@end
