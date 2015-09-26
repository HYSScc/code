//
//  main.m
//  08-autorelease
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 1.autorelease的基本总结
 1> 会将对象放到一个自动释放池中
 2> 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
 3> 会返回对象本身
 4> 调用完autorelease方法后，对象的计数器不变
 
 2.autorelease的好处
 1> 不用关心对象释放时间
 2> 不用关心什么时候调用release
 
 3.autorelease的使用注意
 1> 占用内存较大的对象不要随便使用autorelease，需要精确控制，所以还是用release。
 2> 占用内存较小的对象使用autorelease，没有太大影响
 
 4.错误写法
 1> alloc之后调用了autorelease，又调用了release
    @autoreleasepool
   {
    Person *p = [[[Person alloc] init] autorelease];
    [p release];
    }
 
 2> 连续调用多次autorelease
    @autoreleasepool
    {
    Person *p = [[[[Person alloc] init] autorelease] autorelease];
    }
 
 5.自动释放池
 1> 在IOS程序运行过程中，会创建无数个池子。这些池子都是以栈结构存在（先进后出）
 2> 当一个对象调用autorelease方法时，会将这个对象放到栈顶的释放池
 
 6.自动释放池的创建方式
 1> iOS 5.0前
    NSAutoreleasePool *pool = [NSAutoreleasePool alloc] init];
 
    [pool release]; // [pool drain];->用在MAC上
 
 2> iOS 5.0后
    @autoreleasepool
    {
 
    }
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        
        
    }
    
    return 0;
}

void test()
{
    @autoreleasepool
    {// 开始创建了释放池
        
        // autorelease方法会返回对象本身
        // 调用完autorelease方法后，对象的计数器不变
        // autorelease会将对象放到一个自动释放池中
        // 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
        Person *p = [[[Person alloc] init] autorelease];
        
        
        p.age = 10;
        
        @autoreleasepool
        {
            Person *p2 = [[[Person alloc] init] autorelease];
            
            p2.age = 10;
        }
        
    }// 结束代表自动释放池销毁
}







