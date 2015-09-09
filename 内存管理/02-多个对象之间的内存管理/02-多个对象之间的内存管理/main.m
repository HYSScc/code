//
//  main.m
//  02-多个对象之间的内存 管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 1.你想使用（占有）某个对象，就应该让对象的计数器+1（让对象做一次retain操作）
 2.你不想再使用（占有）某个对象时，就应该让对象的计数器-1（让对象做一次release）
 3.谁retain，谁release
 4.谁alloc，谁release
 */
#import <Foundation/Foundation.h>
#import "Book.h"
#import "Person.h"
int main(int argc, const char * argv[])
{
    
    Book *b = [[Book alloc] init];
    Person *p1 = [[Person alloc] init];
    
    // p1想占有b这本书
    [p1 setBook:b];
    
    [b release];
    b = nil;
    
    
    
    
    
    
    [p1 release];
    p1 = nil;
    return 0;
}
