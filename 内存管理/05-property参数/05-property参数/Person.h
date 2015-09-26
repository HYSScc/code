//
//  Person.h
//  05-property参数
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 1.内存管理相关的参数
 1> retain：release旧值，retain新值（适用于OC对象类型）
 2> assign：直接赋值（默认,适用于非OC对象类型）
 3> copy： release旧值，copy新值
 
 2.是否要生成set方法
 1> readwrite：同时生成setter和getter的声明、实现（默认）
 2> readonly：只会生成getter的声明、实现
 
 3.多线程管理
 1> nonatomic ：性能高（一般就用这个）
 2> atomic    ：性能低（默认）
 
 4.setter和getter方法的名称(重命名方法名)
 1> setter: 决定了set方法的名称，一定要有冒号 :
 2> getter：决定了get方法的名称（一般用在BOOL类型）
 
 */
@interface Person : NSObject

// 返回BOOL类型的方法名一般以is开头
@property ( getter=isRich) BOOL rich;

@property ( getter=abc, setter=setabc: ) int weight;
// setWeight:
// weight

@property (readwrite, assign) int height; // setHeight:  height
@property (assign) int age;
@property (retain) NSString *name;
@end
