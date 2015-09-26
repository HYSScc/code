//
//  main.m
//  06-02-NSMutableDictionary
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 添加键值对
    [dict setObject:@"Jack" forKey:@"name"];
    
    // 且这些键值对没有顺序
    [dict setObject:@"北京" forKey:@"address"];
    
    // 当一个键值对的key相同时，会覆盖上一个键值对
    [dict setObject:@"Rose" forKey:@"name"];
    
    // 移除键值对
    //[dict removeObjectForKey:<#(id)#>];
    
    
    id obj = dict[@"name"];
    
    NSLog(@"%@", obj);
    
    NSLog(@"%@", dict);
    
    return 0;
}
