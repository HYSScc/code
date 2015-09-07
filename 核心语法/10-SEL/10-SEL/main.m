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
SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去找对应的方法地址。找到方法地址就可以调用方法
*/
int main(int argc, const char * argv[])
{
    Person *p = [[Person alloc] init];
    
    [p test2];
//    NSString *name = @"test2";
//    
//    SEL s = NSSelectorFromString(name);
//   
//    [p performSelector:s];
    
    // 间接调用test2方法
    //[p performSelector:@selector(test2)];
    
    
    //[p test2];
    
    // 1.把test2包装成SEL类型的数据
    // 2.根据SEL数据找到对应的方法地址
    // 3.根据方法地址调用对应的方法
    return 0;
}
