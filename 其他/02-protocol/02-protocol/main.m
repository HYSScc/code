//
//  main.m
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

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
