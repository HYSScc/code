//
//  main.m
//  08-类的本质
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

/*
 1.当程序启动时，就会加载项目中的所有的类和分类，而且加载后会调用每个分类的+load方法。只会调用一次。
 2.当第一次使用某个类时，就会调用当前类的+initialize方法(调用时初始化，不调用就不初始化)
 3.先加载父类，再加载子类(先调用父类的+load方法，再调用子类的+load方法)
 先初始化父类，再初始化子类(先调用父类的+initialize方法，在调用子类的+initialize方法)
 4.类和分类优先选择分类中的initialize方法。类和子类，调用子类时，都会调用initialize方法。
 */

int main(int argc, const char * argv[]) {
   
    
    [[Student alloc] init];
    
    return 0;
}


void test1()
{
    Person *p = [[Person alloc] init];
    
    // 内存中的类对象
    // 类对象 == 类
    Class c = [p class];
    [c test];
    
    //[Person test];
}


void test()
{
    // 利用Person这个类创建了2个Person类型的对象
    Person *p = [[Person alloc] init];
    
    Person *p2 = [[Person alloc] init];
    
    Person *p3 = [[Person alloc] init];
    
    // 获取内存中的类对象
    Class c = [p class]; // class方法
    
    Class c2 = [p class]; // c与c2相同，都是同一个类对象
    
    // 获取内存中的类对象
    Class c3 = [Person class];
    
    // 类本身也是一个对象，是一个Class类型的对象，简称类对象
    
    /*
     利用 Class 创建 Person类对象
     
     利用 Person类对象 创建 Person类型的对象
     
     */
}