//
//  Person.m
//  00-点语法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age
{
     _age = age;
    
    NSLog(@"setAge");
    // 会引发死循环
    // self.age = age; // [self.age:age];
    
}

- (int)age
{
    NSLog(@"age");
    return _age;
    
    // 会引发死循环
    return self.age; // [self age];
   
}
@end
