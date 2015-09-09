//
//  Person.m
//  01-引用计数器的基本操作
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
// 当一个Person对象被回收，就会自动调用这个方法
- (void)dealloc
{
    
    
    NSLog(@"Person对象被回收");
    
    // super的dealloc一定要调用，而且放在最后面
    [super dealloc];
}

@end
