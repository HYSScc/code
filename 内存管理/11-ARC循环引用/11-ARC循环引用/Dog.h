//
//  Dog.h
//  11-ARC循环引用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Dog : NSObject
@property (nonatomic, weak) Person *person;
@end
