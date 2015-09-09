//
//  main.m
//  10-ARC的基本使用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
/*
 ARC的判断准则：只要没有强指针指向对象，就会释放对象
 
 1.ARC特点
 1> 不允许调用release、retain、retainCount
 2> 允许重写dealloc，但是不允许调用[super dealloc];
 3> @property的参数
    * strong : 成员变量是强指针，相当于原来的retain（适用于OC对象）
    * weak ：成员变量是弱指针，相当于原来的assign（适用于OC对象）
    * assign：适用于非OC对象类型
 4> 以前的retain改为strong。
 
 指针分两种
 1> 强指针：默认情况下，所有的指针都是强指针 __strong
 2> 弱指针：__weak
 */
int main(int argc, const char * argv[]) {
    
    Dog *d = [[Dog alloc] init];
    
    Person *p = [[Person alloc] init];
    
    p.dog = d;
    
    d = nil;
    
    NSLog(@"%@", p.dog);
    
    return 0;
}

void test()
{
    // 错误写法（没有意义的写法）
    __weak Person *p = [[Person alloc] init];
    
    
    
    NSLog(@"---");
}