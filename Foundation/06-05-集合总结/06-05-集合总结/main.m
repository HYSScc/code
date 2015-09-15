//
//  main.m
//  06-05-集合总结
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
集合
NSArray         List
NSSet           Set
NSDictionary    Map
 
1.NSArray\NSMutableArray
 * 有序
 * 快速创建(不可变)：@[obj1, obj2, obj3];
 * 快速访问元素：数组名[i];
 
2.NSSet\NSMutableSet
 * 无序
 
3.NSDictionary\NSMutableDictionary
 * 无序
 * 快速创建(不可变)：@{key1 : value1, key2 : value2};
 * 快速访问元素：字典名[key]
 
*/
int main()
{
    // 通讯录(保存4个人的基本信息)
    NSArray *persons = @[
      
      @{@"name" : @"xxx", @"qq" : @"123"},
      @{@"name" : @"xxq", @"qq" : @"1234"},
      @{@"name" : @"xxw", @"qq" : @"12345"},
      @{@"name" : @"xxd", @"qq" : @"123456", @"books" : @[@"5分钟突破IOS编程", @"5分钟突破android编程"]}
      
      ];
    // 方法一
    //NSDictionary *xxq = persons[1];
    
    //NSLog(@"%@", xxq);
    
    
    // 方法二
    // 先取出1位置对应的字典
    // 再取出字典中qq这个key对应的数据
    //NSLog(@"%@", persons[1][@"qq"]);

    // 方法三
    //NSArray *array = persons[3][@"books"];
    
    //NSLog(@"%@", array);
    
    // 方法四
    NSLog(@"%@", persons[3][@"books"][0]);
    
    return 0;
}







