//
//  main.m
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//
/*
 内存管理代码规范：
 1.只要调用alloc，必须有release
   如果对象不是通过alloc产生的，就不需要release
 
 2.set方法代码规范
 1> 基本数据类型：直接赋值
 - (void)setAge:(int)age
 {
    -age = age;
}
 2> OC对象类型
 - (void)setCar:(Car *)car
 {
 // 1.先判断是不是新传进来对象
    if (car != _car)
 {
 // 2.对就对象做一次release
    [_car release];
 }
 // 3.对新对象做一次retain
    _car = [car retain];
 
 }
 3.dealloc方法的代码规范
 1> 一定要[super dealloc];而且放在最后面
 2> 对self（当前）所拥有的其他对象做一次release
 - (void)dealloc
 {
    [_car release];
    [super dealloc];
 }
*/
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import "Student.h"
#import "Dog.h"
int main(int argc, const char * argv[])
{
    Student *stu = [[Student alloc] init];
    
    // 这行内存会有泄露
    stu.car = [[Car alloc] init];
    
    
    [stu release];
    
    
    // 这行代码会有泄露
    [[Car alloc] init].speed = 100;
    
    return 0;
}

// 传人学生和dog类
void test3()
{
    Student *stu = [[Student alloc] init];
    Car *c = [[Car alloc] init];
    stu.car = c;
    
    Dog *d = [[Dog alloc]init];
    stu.dog = d;
    
    NSString *s = @"Jack";
    stu.name = s;
    
    
    [d release];
    [c release];
    [stu release];
}

void test2()
{
    Person *p1 = [[Person alloc] init];
    p1.age = 20;
    
    Car *c1 = [[Car alloc] init];
    c1.speed = 100;
    p1.car = c1;
    
    Car *c2 = [[Car alloc] init];
    c2.speed = 200;
    p1.car = c2;
    
    
    [c2 release];
    [c1 release];
    [p1 release];

}

// 当第二次传人相同的变量，需要判断，不然会导致野指针错误
void test1()
{
    Person *p = [[Person alloc] init];
    p.age = 20;
    
    Car *c1 = [[Car alloc] init];
    c1.speed = 120;
    
    p.car = c1;
    
    [c1 release];
    
    p.car = c1;
    p.car = c1;
    p.car = c1;
    
    [p release];
}

// 当拥有第二辆车时，需要释放旧车
void test()
{
    Person *p = [[Person alloc] init];
    p.age = 20;
    
    Car *c1 = [[Car alloc] init];
    c1.speed = 120;
    
    // p想拥有c1
    p.car = c1; // [p setCar:c1];
    
    Car *c2 = [[Car alloc] init];
    c2.speed = 300;
    
    // p将车换成了c2
    p.car = c2;
    
    [c2 release];
    [c1 release];
    [p release];

}
