//
//  main.m
//  10-SEL
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
/*
 调用对象时，需要内存地址；同样调用方法时，也需要内存地址，
 数据类型，SEL就代表一个方法
 每一个SEL对应方法的内存地址
SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去找对应的方法地址。找到方法地址就可以调用方法
*/
int main(int argc, const char * argv[])
{
    Person *p = [[Person alloc] init];
    
    [p test2];
    
    
    
    // 当只知道方法名的字符串类型数据，可以通过以下方法调用
//    NSString *name = @"test2"; // 方法名是字符串
//    
//    SEL s = NSSelectorFromString(name); // 把字符串的方法名转成SEL数据，SEL就代表一个方法
//   
//    [p performSelector:s];
    
    
    // 2.
    // 间接调用test2方法
    //[p performSelector:@selector(test2)]; // @selector将方法包装成SEL类型数据
    // 分解
    //SEL s = @selector(test2);
    //[p performSelector:s];
    
    
    
    // 1.
    //[p test2];
    // 1.把test2包装成SEL类型的数据
    // 2.根据SEL数据找到对应的方法地址
    // 3.根据方法地址调用对应的方法
    return 0;
}
