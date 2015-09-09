//
//  main.m
//  11-ARC循环引用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
/*
 一端用strong，一端用weak。
 */
int main()
{
    Person *p = [[Person alloc] init];
    
    Dog *d = [[Dog alloc] init];

    p.dog = d;
    
    d.person = p;
    
    return 0;
}
