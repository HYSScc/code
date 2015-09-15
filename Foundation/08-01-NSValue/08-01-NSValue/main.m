//
//  main.m
//  08-01-NSValue
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSNumber能包装基本数据类型为对象，原因是继承与NSValue

// NSNumber只能包装数字

// NSValue能包装任何对象

int main()
{
    // 结构体--->OC对象
    
    CGPoint p = CGPointMake(10, 10);
    
    NSValue *value = [NSValue valueWithPoint:p]; // 包装结构体
    
    
    NSArray *array = @[value];
    
    
    [value pointerValue]; // 将value转为对应的结构体
    
    return 0;
}
