//
//  NSString+Number.m
//  07-Category02分类的应用
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

+ (int)numberCountOfString:(NSString *)str
{
    // 定义变量计算数字的个数
    int count = 0;
    
    for (int i = 0; i<str.length; i++) // 调用了length的get方法
    
    {unichar c = [str characterAtIndex:i]; // 调用对象方法返回给定的字符数组的位置
        if ( c>='0' && c<='9')
        {
            count++;
        }
    }
    
    return count;
    //return [str numberCount];
}

- (int)numberCount
{
//    int count = 0;
//    
//    for (int i = 0; i<self.length; i++)
//    {
//        // 取出i这个位置对应的字符
//        unichar c = [self characterAtIndex:i];
//        
//        // 如果这个字符是阿拉伯数字
//        if ( c>='0' && c<='9') {
//            count++;
//        }
//    }
//    return count;
    return [NSString numberCountOfString:self];
}

@end
