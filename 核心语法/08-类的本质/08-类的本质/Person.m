//
//  Person.m
//  08-类的本质
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)test
{
    NSLog(@"调用了test方法");
}


// 当程序启动的时候，就会加载一次项目中所有的类。类加载完毕后就会调用+load方法
+ (void)load
{
    NSLog(@"Person---load");
}

// 当第一次使用这个类的时候，就会调用一次+initialize方法
+ (void)initialize
{
    NSLog(@"Person---initialize");
}

@end
