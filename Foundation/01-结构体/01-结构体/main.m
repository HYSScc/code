//
//  main.m
//  01-结构体
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    /*
     NSRange(location length)
     NSPoint\CGPoint
     NSSizCGRect
     NSRect\CGRect
     */
    
    @"i love oc"; // love的范围
    
    NSRange r1 = {2, 4}; // 不用
    NSRange r2 = {.location = 2, .length = 4}; // 不用
    
    NSRange r3 =  NSMakeRange(2, 4);
    
    
    return 0;
}
