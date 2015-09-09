//
//  main.m
//  09-autorelease的应用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "GoodPerson.h"

/*
 1.系统自带的方法里面没有包含alloc、new、copy、说明返回的对象都是autorelease
 
 2.开发中经常会提供一些类方法，快速创建一个已经autorelease过的对象
 1> 创建对象时不要直接用类名，一般用self
 + (id)person
 {
    return [[[self alloc] init] autorelease];
 }
 
 */
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        GoodPerson *p = [GoodPerson personWithAge:10];
        
        p.money = 100;
    }
        return 0;
}

void test()
{
    Person *p = [[Person alloc] init];
    
    p.age = 20;
    
    [p release];
    
    @autoreleasepool {
        //        Person *p2 = [Person person];
        //
        //        p2.age = 100;
        
        Person *p2 = [Person personWithAge:100];
        
    }

}
