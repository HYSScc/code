//
//  TicketDelegate.h
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
#import "Foundation/Foundation.h"
// 声明一些跑腿的方法

@protocol TicketDelegate <NSObject>

// 返回票价
- (double)ticketPrice;

// 还剩多少张票
- (int)leftTicketsNumber;

@end
