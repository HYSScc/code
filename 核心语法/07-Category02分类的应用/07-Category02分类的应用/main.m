//
//  main.m
//  07-Category02分类的应用
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Number.h"

// 给NSString增加一个类方法：计算某个字符串中阿拉伯数字的个数
int main(int argc, const char * argv[])
// 类库：很多类的集合
{
    
    
    
    //int count = [NSString numberCountOfString:@"1834fdfsdf"];
    
    int count = [@"678faarg" numberCount];
    
    NSLog(@"%d", count);
    
    return 0;
}
