//
//  Car.m
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setSpeed:(int)speed
{
    _speed = speed;
}

- (int)speed
{
    return _speed;
}

- (void)dealloc
{
    NSLog(@"速度为%d的Car对象被回收", _speed);
    
    [super dealloc];
}
@end
