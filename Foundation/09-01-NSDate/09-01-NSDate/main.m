//
//  main.m
//  09-01-NSDate
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    // 将字符串转成时间对象
    NSString *time = @"2011/09/10 18:23";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm";
    
    NSDate *date = [formatter dateFromString:time]; // 将字符串转换成date对象
    
    NSLog(@"%@", date);
    
    return 0;
}


// date转成字符串

void test2()
{
    // 日期格式化
    NSDate *date = [NSDate date];
    
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // y 年 M 月 d 日
    // m 分 s 秒 H (24)时 h(12)时
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    
    NSString *str = [formatter stringFromDate:date]; // 将时间转成字符串
    
    NSLog(@"%@", str);
}



void test()
{
    // 创建一个时间对象
    NSDate *date = [NSDate date]; // 创建出的时间对象就代表当前时间(执行这一行代码的时间)
    
    // 打印出的时间是0时区的时间
    NSLog(@"%@", date);
    
    // date2比date晚5秒钟
    NSDate *date2 = [NSDate dateWithTimeInterval:5 sinceDate:date];
    
    // 从1970年开始走过的秒数
    NSTimeInterval seconds = [date2 timeIntervalSince1970];
    
    // 调用代码的时间和date2时间之间的时间段
    [date2 timeIntervalSinceNow];

}
