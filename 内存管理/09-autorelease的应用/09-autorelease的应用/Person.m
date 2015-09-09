//
//  Person.m
//  09-autorelease的应用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)person
{
    return [[[self alloc] init] autorelease];
}

+ (id)personWithAge:(int)age
{
    Person *p = [self person];
    p.age = age;
    return p;
}

- (void)dealloc
{
    NSLog(@"%d岁的人被销毁", _age);
    
    [super dealloc];
}
@end
