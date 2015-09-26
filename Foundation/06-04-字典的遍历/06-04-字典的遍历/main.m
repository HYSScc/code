//
//  main.m
//  06-04-字典的遍历
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    // 字典不允许有相同的key，但允许有相同的value（Object），不然一个key取出多个值。
    // 字典是无序的
    NSDictionary *dict = @{@"name" : @"Jack", @"qq" : @"3255"};
    
    // 遍历方式
    /*
    NSArray *keys = [dict allKeys]; // 先拿出所有的key
    
    for (int i = 0; i<dict.count; i++)
    {
        
        //[keys objectAtIndex:i]; // 方法太长，直接用keys[i];
        NSString *key = keys[i];  // 简写，取出key
        NSString *object = dict[key]; // 简写，根据key取出字典中的文件内容
        
        
        NSLog(@"%@ = %@", key, object);
    }
    */
    
    // 遍历方式
    [dict enumerateKeysAndObjectsUsingBlock:
     ^(id key, id obj, BOOL *stop) {
        NSLog(@"%@ - %@", key, obj);
         
         
        //*stop = YES; // 遍历完一次就停止
         
    }];
    
    
    
    return 0;
}
