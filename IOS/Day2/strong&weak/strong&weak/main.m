//
//  main.m
//  strong&weak
//
//  Created by tom-pc on 15/9/29.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 在OC中
 1. 如果对象没有强指针，会被立即释放
 2. 默认的对象，都是强指针
 
 __weak 表示弱引用
 
 3.如果用Stroyboard拖线，控件用weak。
 
   自定对象，需要使用strong
 
   如果代码创建界面，控件可以用strong
 
   字符串类型，使用copy；
 
   数字型，int，使用assign
 */

int main(int argc, const char * argv[]) {
    
    Person *p = [[Person alloc] init];
    
    p.name = @"zhangsan";
    
    return 0;
}
