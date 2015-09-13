//
//  main.m
//  04-计算代码行数
//
//  Created by tom-pc on 15/9/13.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 考察NSString、NSArray的使用
 * NSFileManager
 */



// 计算单个文件的代码行数
/*
 path : 文件的全路径
 返回值 int ：代码行数
 */
NSUInteger codeLineCount(NSString *path)
{
    // 加载文件内容
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", content); // 打印出文件内容
    
    NSArray *array = [content componentsSeparatedByString:@"\n"];
    
    // 将分割好的每一个数组元素打印出来
    int i = 0;
    for (NSString *line in array)
    {
        NSLog(@"%d - %@", i, line);
        i++;
    }
    
    return array.count; // 获取array中的元素个数
}


int main()
{
    // 将文件分割打印出
//    NSString *str = @"jack-rose-ii-aa";
//    NSArray *array = [str componentsSeparatedByString:@"-"];
//    int i = 0;
//    for (NSString *line in array)
//    {
//        NSLog(@"%d - %@", i, line);
//        i++;
//    }
    
    
    
    
    
    NSUInteger count = codeLineCount(@"/Users/tom/Documents/code/test.m");
    
    NSLog(@"count=%ld", count);
    return 0;
}
