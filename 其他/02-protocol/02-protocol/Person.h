//
//  Person.h
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Myprotocol3.h"
//@protocol Myprotocol3;
@class hashiqi;
// 只要一个类遵守某一份协议，就能拥有这份协议中的所有方法声明

//  : 继承父类
//  <> 遵守协议
@interface Person : NSObject <Myprotocol3>


@property (nonatomic, strong) id<MyProtocol > obj;

@property (nonatomic, strong) hashiqi *dog;

@end
