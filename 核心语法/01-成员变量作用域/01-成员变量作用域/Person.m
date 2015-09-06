
//
//  Person.m
//  01-成员变量作用域
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    int _aaa;  // 默认私有
    // @implementation中不能定义和@interface中同名的变量
    
}


- (void)test
{
    _age = 10;
    
    _height = 100;
    
    _weight = 50;
}

- (void)setHeight:(int)height
{
    _height = height;
}

- (int)height
{
    return _height;
}
@end
