//
//  Person.m
//  04-构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

//// 重写-init方法
//- (instancetype)init
//{
//    // 1.一定要调用会super的init方法：初始化父类中声明的一些成员变量和其他属性
//    self = [super init]; // 当前对象 self
//    
//    // 2.如果对象初始化成功，才有必要进行接下来的初始化
//    if (self != nil) {
//        // 初始化成功
//        _age = 10;
//    }
//    
//    // 3.返回一个已经初始化完毕的对象
//    return self;
//}

- (instancetype)init
{
    if ( self = [super init] )
    {
        _age = 10;
    }
    return self;
}

@end
