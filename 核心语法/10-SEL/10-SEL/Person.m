//
//  Person.m
//  10-SEL
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)test
{
    NSLog(@"test---");
}

- (void)test2
{
    
    // 每个方法内部都有个隐藏的SEL数据_cmd
    // _cmd代表着当前方法
    //_cmd == @selector(test2);
    
   // NSString *str = NSStringFromSelestor(_cmd); // _cmd不能直接打印，转成字符串类型打印
    
    // 会引发死循环
    //[self performSelector:_cmd];
    
    //NSLog(@"test2---%@", str);
}
@end
