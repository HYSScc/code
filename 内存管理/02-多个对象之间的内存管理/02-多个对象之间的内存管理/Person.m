//
//  Person.m
//  02-多个对象之间的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setBook:(Book *)book
{
    _book = [book retain];
}

- (Book *)book
{
    return _book;
}

- (void)dealloc
{
    [_book release];
    NSLog(@"Person对象被回收");
    
    [super dealloc];
}

@end
