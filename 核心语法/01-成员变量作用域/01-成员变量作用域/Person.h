//
//  Person.h
//  01-成员变量作用域
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 @public : 任何地方都能通过成员变量名直接访问对象的成员变量
 @private : 只能在当前类的对象方法中直接访问(@implementation中默认是@private)
          : 子类可以通过setter和getter方法访问父类中的@private成员变量
 @protected : 能在当前类和子类的对象方法中直接访问(@interface中默认时@protected)
 @package : 只要处于同一个框架中，就能直接访问对象的成员变量
 
 @interface和@implementation中不能声明同名的成员变量
 */



#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _no;
    
    @public // 任何地方都能访问对象的成员变量
    int _age;
    
    @private // 只能在当前类的对象方法中直接访问
    int _height;
    
    @protected // 能在当前类和子类的对象方法中直接访问
    int _weight;
    int _money;
}

- (void)test;

- (void)setHeight:(int)height;
- (int)height;

@end
