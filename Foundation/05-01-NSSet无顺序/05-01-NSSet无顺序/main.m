//
//  main.m
//  05-01-NSSet无顺序
//
//  Created by tom-pc on 15/9/14.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    
    NSSet *s = [NSSet set]; // 调用方法定义一个数组，且不可变
    
    NSSet *s2 =[NSSet setWithObjects:@"Jack", @"Rose", @"jim", @"bao", nil]; // 调用方法，在数组中定义多个元素，与NSArray数组一样不能定义空值。
    
    NSString *str = [s2 anyObject]; // 随机返回对象随机拿出对象，且对象是字符串类型
    
    
    NSLog(@"%@", str);
    NSLog(@"%ld", s2.count); // count方法，计算数组元素个数
    
        return 0;
}
