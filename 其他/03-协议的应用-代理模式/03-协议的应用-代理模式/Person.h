//
//  Person.h
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicketDelegate.h"

@interface Person : NSObject

- (void)buyTicket;

// 拥有一个代理属性
// 代理的类型随便，必须遵守TicketDelegate协议
@property (nonatomic, strong) id<TicketDelegate> delegate;

@end
