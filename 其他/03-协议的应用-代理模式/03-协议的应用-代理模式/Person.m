//
//  Person.m
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"


@implementation Person


// 买电影票
- (void)buyTicket
{
    // 叫代理去帮自己买票（询问一下票价，询问一下票的剩余张数）
    double price = [_delegate ticketPrice];
    int number = [_delegate leftTicketsNumber];
    
    NSLog(@"通过代理的帮忙，票价=%f,还剩%d张", price, number);
}

@end
