//
//  Person.m
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setCar:(Car *)car
{
    if (car != _car)
    {
    // 对当前正在使用的车（旧车）做一次release
    [_car release]; // 默认情况下（还未给car赋值的情况下），_car的值为空
    
    // 对新车做一次retain操作
    _car = [car retain];
    }
}

- (Car *)car
{
    return _car;
}

- (void)setAge:(int)age
{
    // 基本数据类型是不需要管理内存
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)dealloc
{
    // 当人不在时，要对车做一次release操作
    [_car release];
    
    NSLog(@"%d岁的Person对象被回收", _age);
    
    
    [super dealloc];
}

@end
