//
//  main.m
//  01-引用计数器的基本操作
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 1.方法的基本使用
 1> retain ：计数器+1，会返回对象本身
 2> release ：计数器-1，没有返回值
 3> retainCount ：获取当前的计数器
 4> dealloc
  * 当一个对象要被回收的时候，就会调用
  * 一定要调用[super dealloc],这句调用一定要放在最后
 
 2.概念
 1> 僵尸对象 ：所占用内存已经被回收的对象，僵尸对象不能再使用
 2> 野指针 ：指向僵尸对象（不可用内存)的指针，给野指针发送消息会报错
 3> 空指针 ：没有指向任何东西的指针（储存的东西是nil、null、0），给空指针发送消息不会报错
 
 3.retain方法
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    // 1
    Person *p = [[Person alloc] init];
    
    //NSUInteger c = [p retainCount];
    
    //NSLog(@"计数器：%ld", c);
    
    // 2 retain方法返回的是对象本身
    [p retain];
    
    // 1
    [p release];
    
    // 0 野指针：指向僵尸对象（不可用内存） 的指针
    [p release];
    
    // message sent to deallocated instance 0x100106b30
    // 给已经释放的对象发送一条消息：
    //[p retain];
    
    // -[Person setAge:]:message sent to deallocated instance 0x100106b30
    // 给已经释放的对象发送一条-setAge：消息：
    //p.age = 10;
    
    // 指针p变成空指针
    p = nil;
    
    // EXC_BAD_ACCESS:访问了一块坏的内存
    // 野指针错误
    // OC中没有空指针错误
    [p release];
    
    
    return 0;
}
