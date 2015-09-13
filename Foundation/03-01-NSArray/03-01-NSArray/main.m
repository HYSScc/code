//
//  main.m
//  03-01-NSArray
//
//  Created by tom-pc on 15/9/13.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 NSArray : 不可变数组
 
 NSMutableArray : 可变数组
 */
int main()
{
    // OC数组不能存放nil值
    // OC数组只能存放OC对象，不能存放非OC对象类型，比如int、struct、enum等
    
    // 这个array永远是空数组
    //NSArray *array = [NSArray array];
    
    /*
     1.NSArray的创建
     */
    NSArray *array2 = [NSArray arrayWithObject:@"Jack"];
    
    NSArray *array3 = [NSArray arrayWithObjects:@"Jack", @"Rose", nil];
    
    NSArray *array4 = @[@"Jack", @"Rose", @"2323"]; // 快速创建一个NSArray数组
    
    /*
     2.NSArray的元素个数
    */
    //[array2 count]; // 获取OC数组中的元素个数
    
    NSLog(@"%ld", array2.count); // 获取OC数组中的元素个数
    
    NSLog(@"%@", [array3 objectAtIndex:1]); // 取出数组中的元素
    
    //array3[1];
    
    NSLog(@"%@", array3[0]); // 取出数组中的元素
    
    return 0;
}
