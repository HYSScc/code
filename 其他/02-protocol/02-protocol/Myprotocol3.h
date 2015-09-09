//
//  Myprotocol3.h
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

// 一个协议遵守了另一个协议，就可以拥有另一个协议的所有方法声明 

@protocol Myprotocol3 <MyProtocol, NSObject>
- (void)hehe;
@end
