//
//  main.m
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agent.h"
#import "NextAgent.h"

int main(int argc, const char * argv[])
{
    // 人
    Person *p = [[Person alloc] init];
    
    // 代理
    Agent *a = [[Agent alloc] init];
    
    // Next代理
    NextAgent *b = [[NextAgent alloc] init];
    
    // 设置人的代理属性
    p.delegate = a;
    
    [p buyTicket];
    
    p.delegate = b;
    
    // 人打算看电影
    [p buyTicket];
    
    
    return 0;
}
