//
//  Student.m
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setNo:(int)no
{
    _no = no;
}
- (int)no
{
    return _no;
}

- (void)setName:(NSString *)name
{
    if ( name != _name)
    {
        [_name release];
        _name = [name retain];
    }
}
- (NSString *)name
{
    return _name;
}

- (void)setCar:(Car *)car
{
    if ( car != _car)
    {
        [_car release];
        _car = [car retain];
    }
}
- (Car *)car
{
    return _car;
}


- (void)setDog:(Dog *)dog
{
    if ( dog != _dog)
    {
        [_dog release];
        _dog = [dog retain];
    }
}
- (Dog *)dog
{
    return _dog;
}

- (void)dealloc
{
    [_name release];
    [_car release];
    [_dog release];
    
    [super dealloc];
}

@end
