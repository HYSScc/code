
//
//  Person.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
// @synthesize自动生成age的setter和getter实现，并且访问_age这个成员变量
@synthesize age = _age;
//@synthesize age = age;
//- (void)setAge:(int)age
//{
//    self->age = age;
//}
@synthesize height = _height;
@synthesize weight = _weight;
@synthesize name = _name;
- (void)test
{
    NSLog(@"age=%i, _age=%i", age, _age);
}
@end
