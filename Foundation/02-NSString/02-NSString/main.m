//
//  main.m
//  02-NSString
//
//  Created by tom-pc on 15/9/12.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 NSString : 不可变字符串
 
 NSMutableString : 可变字符串
 */
int main()
{
    
    // 字符串的创建
    
    NSString *s1 = @"1";
    
    //NSString *s2 = [NSString alloc] initWithString:@"2";
    
    // 拼接字符串
    NSString *s3 = [[NSString alloc] initWithFormat:@"age is %d", 10];
    
    // C字符串 -> OC字符串
    NSString *s4 = [[NSString alloc] initWithUTF8String:"jack"];
    
    // OC字符串 -> C字符串
    const char *cs = [s4 UTF8String]; // const关键字与一些常量相关
    
    // 读取文件，将一份文件转成字符串
    // NSUTF8StringEncoding 用到中文就可以用这种编码
    NSString *s5 = [[NSString alloc] initWithContentsOfFile:@"/Users/tom/Desktop/" encoding:NSUTF8StringEncoding error:nil]; // 绝对路径，涉及中文传的编码是:NSUTF8StringEncoding
    
    // URL : 资源路径
    // 协议头://路径
    // file://        // 本地文件
    // ftp://
    // Http://weibo.com/a.png
    
    // 读取文件
    NSURL *url = [[NSURL alloc] initWithString:@"file:///Users/tom/Desktop/"];
    NSString *s6 = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"s5=%@", s5);
    
    
    
    // 类方法(系统提供类方法，前面都是调用对象方法)
    // 一般都会有一个类方法和对象方法配对
    [NSString stringWithFormat:@""];
    //[NSString stringWithContentsOfFile:<#(NSString *)#> encoding:<#(NSStringEncoding)#> error:<#(NSError *__autoreleasing *)#>];
    
    
    //[NSURL URLWithString:<#(NSString *)#>];
    
    // 与s6的上一句效果相同，直接跟上文件路径，不用跟上协议头，因为在类方法中已经说明是file文件，就告诉它是本地文件
    //NSURL *url = [NSURL fileURLWithPath:@"/Users/tom/Desktop/"];
    
    
    
        // 字符串导出保存//YES原子性

    [@"jack\njack" writeToFile:@"/Users/tom/Desktop/字符串创建.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *str3 = @"432352";
    NSURL *url3 = [NSURL fileURLWithPath:@"/Users/tom/Desktop/字符串创建3.txt" ];
    [str3 writeToURL: url3 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    return 0;
}
