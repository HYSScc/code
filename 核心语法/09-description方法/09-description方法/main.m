//
//  main.m
//  09-description方法
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


void test9()
{
    // 输出当前函数名
    NSLog(@"%s\n", __func__);
}

int main(int argc, const char * argv[])
{
    // 输出当前行号
    NSLog(@"%d", __LINE__);
    
    // NSLog输出C语言字符串的时候，不能有中文
    // NSLog(@"%s", __FILE__);
    
    // 输出源文件的名称
    printf("%s\n", __FILE__);
    
    test9();
    
    Person *p = [[Person alloc] init];
    
    // 指针变量的地址
    NSLog(@"%p", &p);
    // 对象地址
    NSLog(@"%p", p);
    // <类名：对象地址>
    NSLog(@"%@", p);
       return 0;
}


void test2()
{
    Class c = [Person class];
    
    // 1.会调用类的+description方法
    // 2.拿到+description方法的返回值（NSString *）显示到屏幕上
    NSLog(@"%@", c);
 
}


void test()
{
    Person *p = [[Person alloc] init];
    
    p.age = 21;
    p.name = @"Xxm";
    // 默认情况下，利用NSLog和%@输出对象，结果是：<类名：内存地址>
    
    // 1.会调用对象p的—description方法
    // 2.拿到-description方法的返回值（NSString *）显示到屏幕上
    // 3.-description方法默认返回的是“类名+内存地址”
    NSLog(@"%@", p); // 输出所有属性，但必须重写-description方法
}
