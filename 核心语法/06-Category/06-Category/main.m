//
//  main.m
//  06-Category
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Xxm.h"
/* 分类：可以给某一个类扩充一些方法（不修改原来类的代码）
   声明
   @interface 类名（分类名称）
   @end
   实现
   @implementation 类名（分类名称）
   @end
 
 分类的作用：在不改变原来类内容的基础上，可以为类增加一些方法
 
 使用注意：
 1.分类只能增加方法，不能扩充成员变量。
 2.分类方法实现中，可以访问原来类中声明的成员变量
 3.分类可以重新实现原来类中的方法，但是会覆盖掉原来的方法，会导致原来的方法没法在使用
 4.方法调用的优先级： 分类（最后参与编译的分类优先）--> 原来类 --> 父类
 
 */

int main(int argc, const char * argv[]) {
    
    Person *p = [[Person alloc] init];
    
    // 优先去分类中查找，然后再去原来类中找，最后再去父类中查找
    [p test];
    
    [p study];
    
    return 0;
}
