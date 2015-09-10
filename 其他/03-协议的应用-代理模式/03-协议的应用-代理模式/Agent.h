//
//  Agent.h
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

// 负责询问电影票的代理

#import <Foundation/Foundation.h>
#import "TicketDelegate.h"

@interface Agent : NSObject <TicketDelegate>

@end
