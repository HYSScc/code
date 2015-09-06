//
//  main.m
//  05-自定义构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main() {
    
//    Person *p = [[Person alloc] initWithName:@"Rose" andAge:10];
//    
//    NSLog(@"%@, %d", p.name, p.age);
    
    
    
    
//    Student *stu = [[Student alloc] initWithNo:11];
//    
//    NSLog(@"%d", stu.no);
//
    
    Student *stu = [[Student alloc] initWithNo:2 andName:@"Tom" andAge:20];
    
    NSLog(@"%d, %@, %d", stu.no, stu.name, stu.age);
    return 0;
}
