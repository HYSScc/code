//
//  main.m
//  03-03-NSMutableArray
//
//  Created by tom-pc on 15/9/14.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
/*
NSMutableArray : 可变数组
*/
int main()
{
    //NSMutableArray *array = [NSMutableArray array]; // 定义一个数组，调用array方法
    
    // 定义一个数组，同时传人元素
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Jack", @"hh", nil];
    
    // 添加元素
    [array addObject:[[Person alloc] init]]; // 将Person类添加到array这个数组中
    
    [array addObject:@"Jack"]; // 将字符串Jack添加到数组array中
    
    // 删除元素
    //[array removeAllObjects]; // 删除所有元素
    [array removeObject:@"Jack"]; // 删除数组中指定的Jack元素
    [array removeObjectAtIndex:1];
    
    // 错误写法
    // @[] 只能创建不可变数组NSArray
    //[array addObject:10]; // 数组不能定义基本数据类型
    //[array addObject:nil]; // 数组不能为空
    
    NSLog(@"%@", array);
    NSLog(@"%ld", array.count);
    
    return 0;
}
