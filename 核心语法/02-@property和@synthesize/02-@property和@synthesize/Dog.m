//
//  Dog.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Dog.h"

@implementation Dog
//@synthesize age = _age;
//- (int)age
//{
//    return 10;
//}

// 同时实现set和get方法，@property就不会生成setter和getter方法和_age成员变量
- (void)setAge:(int)age
{
    _age = age;
}

//- (int)age
//{
//    return _age;
//}
@end
