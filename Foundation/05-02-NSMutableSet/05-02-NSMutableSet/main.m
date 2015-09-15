//
//  main.m
//  05-02-NSMutableSet
//
//  Created by tom-pc on 15/9/14.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 NSSet和NSArray
 1> 相同点
 * 都是集合，都能存放多个OC对象
 * 只能存放OC对象，不能存放非OC对象类型（基本数据类型：int、char、float等，结构体，枚举）
 
 * 本身都是不可变，且都有一个可变的子类
 
 2> 不同点
 * NSArray有顺序，NSSet无顺序
 */

int main()
{
    NSMutableSet *s =[NSMutableSet set]; // 调用set方法定义一个数组
    
    // 添加元素
    [s addObject:@"hack"];
    
    // 删除元素
    [s removeObject:@"hack"];
    
    return 0;
}
