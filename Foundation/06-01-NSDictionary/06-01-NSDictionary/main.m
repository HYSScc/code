//
//  main.m
//  06-01-NSDictionary
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    /*
     字典：根据一个标示能找到对应的东西
     
     key ---> value
     索引 ---> 文字内容
     
     里面存放的都是键值对
     
     */
    
    //NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Jack" forKey:@"name"];
    
    /*
    NSArray *keys = @[@"name", @"address"];
    NSArray *objects = @[@"Jack", @"北京"];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    */
    
    /*
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Jack", @"name",
                          @"24235425", @"qq", nil];
    */
    
    // 编译器特性
    // 快速创建字典
    // 简化上一行代码
    NSDictionary *dict = @{@"name" : @"Jack", @"qq" : @"235234"};
    
    
    //id obj = [dict objectForKey:@"qq"]; // 根据key取出文字内容
    
    // 简化上一行代码
    id obj = dict[@"name"];
    
    NSLog(@"%@", obj);
    
    // 返回的是键值对的个数
    NSLog(@"%ld", dict.count);
    
    return 0;
}
