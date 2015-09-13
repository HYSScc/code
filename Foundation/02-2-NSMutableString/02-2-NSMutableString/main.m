//
//  main.m
//  02-2-NSMutableString
//
//  Created by tom-pc on 15/9/12.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSString : 不可变字符串

int main()
{
    NSMutableString *s1 = [NSMutableString stringWithFormat:@"age is 10"];
    // 拼接内容到s1的后面
    [s1 appendString:@" 11 12"];
    // 删除文件
    //[s1 deleteCharactersInRange:NSMakeRange(4, 2)];
    
    // 获取is的范围,删除文件
    NSRange range = [s1 rangeOfString:@"is"];
    [s1 deleteCharactersInRange:range];
    
    
    
    NSString *s2 = [NSString stringWithFormat:@"age is 10"];
    // 并是不拼接在源字符串上，而是重新创建一个新的字符串，在s2的基础上，加上拼接内容
    NSString *s3 = [s2 stringByAppendingString:@" 11 12"];
    
    NSLog(@"s1=%@, s2=%@, s3=%@", s1, s2, s3);
    
    return 0;
}
