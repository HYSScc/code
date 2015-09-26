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
     NSPoint\CGPoint(x, y)
     NSSize\CGsize(width,height)
     NSRect\CGRect
     */
    
    // 使用这些函数的前提是添加CoreGraphics框架
    
    // 比较两个点是否相同(x,y)
    BOOL b = CGPointEqualToPoint(CGPointMake(10, 10), CGPointMake(10, 10));
    // 比较是否相同
    //CGSizeEqualToSize(<#CGSize size1#>, <#CGSize size2#>)
    //CGRectEqualToRect(<#CGRect rect1#>, <#CGRect rect2#>)
    
    BOOL b2 = CGRectContainsPoint(CGRectMake(50, 40, 100, 50), CGPointMake(130, 70)); //判断范围中，是否包含这个点
    
    
    NSLog(@"%d", b2);
    return 0;
}

//    CGRect myRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
//    {
//        CGRect rect;
//        rect.origin.x = x;
//        rect.origin.y = y;
//        rect.size.width = width;
//        rect.size.height = height;
//        
//        return rect;
//    }


void point()
{
    CGPoint p1 = NSMakePoint(10, 10); // 函数调用，返回是CGPoint
    NSPoint p2 = CGPointMake(20, 20); // 两种方法相同，下者更常用
    
    
    NSSize s1 = CGSizeMake(100, 50);
    NSSize s2 = NSMakeSize(100, 50);
    CGSize s3 = NSMakeSize(100, 50);
    
    CGRect r1 = CGRectMake(0, 0, 100, 50);
    CGRect r2 = {{0, 1}, {100, 50}};
    CGRect r3 = {p1, s1};
    CGRect r4 = {CGPointZero, CGSizeMake(100, 50)};
    
    CGPointMake(0, 0);
    // 表示原点
    //CGPointZero == CGPointMake(0, 0);
    
    NSString *str =  NSStringFromPoint(p1); // 将结构体转字符串 ，直接打印
    NSLog(@"%@", str);
    
    NSString *str2 = NSStringFromRect(r1);
    NSLog(@"%@", str2);
    
    // 将成员变量打印出
    // NSLog(@"x=%f, y=%f, width=%f, hright=%f", r1.origin.x, r1.origin.y, r1.size.width, r1.size.height);
}


void range()
{
    //    @"i love oc"; // love的范围
    //
    //    NSRange r1 = {2, 4}; // 不用
    //    NSRange r2 = {.location = 2, .length = 4}; // 不用
    //
    //    NSRange r3 =  NSMakeRange(2, 4); // Foundation自带函数，确定love的范围
    
    
    
    
    
    
    // 输出字符串中love的location和length
    NSString *str = @"i love oc"; // 字符串的创建
    
    // 查找某个字符串在str中的范围
    // 如果找不到，length=0，location==NSNotFound==-1
    NSRange range = [str rangeOfString:@"love"]; // 系统自带的方法，查找某个字符串的范围
    
    NSLog(@"loc = %ld, length = %ld", range.location, range.length);

}
