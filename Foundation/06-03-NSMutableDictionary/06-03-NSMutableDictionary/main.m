//
//  main.m
//  06-03-NSMutableDictionary
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    // 快速创建只适合NSDictionary
    NSMutableDictionary *dict = @{@"name" : @"Jack"};
    
    [dict setObject:@"Rose" forKey:@"name"];
    
    return 0;
}
