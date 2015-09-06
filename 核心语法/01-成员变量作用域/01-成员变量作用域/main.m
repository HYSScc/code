//
//  main.m
//  01-成员变量作用域
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    
//    Person *p = [Person new];
//    
//    //p->_age = 100;
//    
//    [p setHeight:100];
//    
//    int a = [p height];
//    
//    NSLog(@"%i", a);
    
    Student *stu = [Student new];
    
    [stu setHeight:110];
    int a = [stu height];
    NSLog(@"%i", a);
    
    return 0;
}
