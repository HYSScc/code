//
//  main.m
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 1.协议的定义
 @protocol 协议名称 <NSObject>
 // 方法声明列表……
 @end
 
 2.如何遵守协议
 1> 类遵守协议
 @interface 类名 ：父类名 <协议名称1，协议名称2>
 
 @end
 
 2> 协议遵守协议
 @protocol 协议名称 <其他协议名称，协议名称2>
 
 @end
 
 3.协议方法声明中的关键字
 1> @required （默认）
    要求实现。
 
 2> @optional
    不要求实现
 
 4.定义一个变量的时候，限制这个变量保存的对象遵守某个协议
 类名<协议名称> *变量名；
 id<协议名称> 变量名；
 NSObject<MyProtocol> *obj;
 id<MyProtocol> obj;
 
 如果没有遵守对应的协议，编译器会报警
 
 5.@protocol中声明的属性也可以做一个遵守协议的限制
 @proterty (nonatomic, strong) 类名<协议名称> *属性名;
 @proterty (nonatomic, strong) id<协议名称> 属性名;
 
 @proterty (nonatomic, strong) Dog<MyProtocol> *dog;
 @proterty (nonatomic, strong) id<协议名称> dog2;
 
 6.协议可以定义在单独.h文件中，也可以定义在某个类中
 1> 如果这个协议只用在某个类中，应该把协议定义在该类中
 2> 如果这个协议用在很多类中，就应该定义在单独文件中
 
 7.分类可以定义在单独.h和.m文件中，也可以定义在原来类中
 1> 一般情况下，都是定义在单独文件
 2> 定义在原来类中的分类，只要求能看懂语法
 */

#import <Foundation/Foundation.h>
#import "MyProtocol.h"
#import "Person.h"
#import "Myprotocol3.h"
#import "Dog.h"
#import "hashiqi.h"

int main()
{
    Person *p = [[Person alloc] init];
    
    p.obj = [[Dog alloc] init];
    
    p.obj = [[hashiqi alloc] init];
    return 0;
}

void test()
{
    //NSObject *obj = [[NSObject alloc] init];
    
    //NSObject *obj2 = @"234232";
    
    // 要求obj3保存的对象必须是遵守是MyProtocol这个协议的
    
    //NSObject<MyProtocol> *obj3;
    
    //obj3 = [[NSObject alloc] init];
    
    NSObject<MyProtocol> *obj4 = [[Person alloc] init];
    
    obj4 = nil;
    
    id<MyProtocol> obj5 = [[Person alloc] init];
    
    obj5 = nil;
    
    // 要求obj6，保存的对象必须遵守MyProtocol3、并且继承了Person
    Person<Myprotocol3> *obj6;
    
    obj6 = nil;
}
