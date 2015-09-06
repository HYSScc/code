//
//  Person.m
//  05-自定义构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if (self = [super init])
    {
        _name = @"Jack";
    }
    return self;
}

- (id)initWithName:(NSString *)name
{
    if ( self = [super init] ) {
        _name = name;
    }
    return self;
}

- (id)initWithAge:(int)age
{
    if ( self = [super init] )
    {
        _age = age;
    }
    return self;
}

- (id)initWithName:(NSString *)name andAge:(int)age
{
    if ( self = [super init] )
    {
        _name = name;
        _age = age;
    }
    return self;
}
@end
