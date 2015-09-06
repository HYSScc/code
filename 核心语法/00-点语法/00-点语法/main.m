//
//  main.m
//  00-点语法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main() {
    
    Person *p = [Person new];
    
    //[p setAge:10];
    p.age = 10;
    
    //int a = [p age];
    int a = p.age;
    
    return 0;
}
