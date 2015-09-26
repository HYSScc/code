//
//  main.m
//  03-01-NSArray
//
//  Created by tom-pc on 15/9/13.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 NSArray : 不可变数组 OC数组
 
 NSMutableArray : 可变数组
 */
int main()
{
    /*c语言数组只能放一种类型的数据
     int a = 5;
     
     int ages[10] = {1, 90, 89. 12};
    
     Person *p = [Person alloc] init];
     
     Person *person[5] = {p, [Perosn alloc] init]}; //数组中包含两个Person对象,且只能存放Person对象，因为返回值是Person *
    
    */
    // OC数组不能存放nil值
    // OC数组只能存放OC对象，不能存放非OC对象类型，比如int、struct、enum等
    
    // 这个array永远是空数组
    //NSArray *array = [NSArray array];
    
    /*
     1.NSArray的创建
     */
    NSArray *array2 = [NSArray arrayWithObject:@"Jack"];
    
    NSArray *array3 = [NSArray arrayWithObjects:@"Jack", @"Rose", nil]; //nil是结束标记，nil前面的都属于数组元素
    
    NSArray *array4 = @[@"Jack", @"Rose", @"2323"]; // 快速创建一个NSArray数组
    
    /*
     2.NSArray的元素个数
    */
    //[array2 count]; // 获取OC数组中的元素个数
    
    NSLog(@"%ld", array2.count); // 获取OC数组中的元素个数,是get方法
    
    NSLog(@"%@", [array3 objectAtIndex:1]); // 取出数组中的元素，传人一个值，取出元素
    
    //array3[1];
    
    NSLog(@"%@", array3[0]); // 取出数组中的元素
    
    return 0;
}
