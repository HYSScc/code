//
//  Cat.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Cat.h"

@implementation Cat

// 默认会访问age这个成员变量,如果没有age，就会生成@private类型的age变量
// @synthesize age;
@synthesize age = _age; // 默认访问_age这个成员变量

@end
