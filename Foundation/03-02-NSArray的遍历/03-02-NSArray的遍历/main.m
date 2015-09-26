//
//  main.m
//  03-02-NSArray的遍历
//
//  Created by tom-pc on 15/9/13.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main()
{
    Person *p = [[Person alloc] init];
    
    NSArray *array = @[@"Jack", @"Rose", p]; // 快速创建一个OC数组
    
    // 打印数组中的元素
//    for (int i = 0; i<array.count; i++) {
//        NSLog(@"%@", array[i]);
//    }
    
    // 快速遍历
    // 打印数组中的元素
    // id obj代表着数组中的每一个元素,id obj in array会把数组中的每一个元素赋值给obj，赋值一次就调用一次循环体
//    for (id obj in array)
//    {
//        // 找出obj元素在数组中的位置(索引)
//        NSUInteger i = [array indexOfObject:obj];
//        
//        NSLog(@"%ld - %@", i, obj);
//    }
    
    // 打印数组中的元素
    [array enumerateObjectsUsingBlock:
     // 每遍历到一个元素，就会调用一次block
     // 并且当前元素和索引位置当做参数传给block
     ^(id obj, NSUInteger idx, BOOL *stop) {
         NSLog(@"%ld - %@", idx, obj);
    }];
    
    
    
    return 0;
}
