//
//  Person.m
//  09-description方法
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

// 决定了实例对象的输出结果
//- (NSString *)description
//{
//    // 下面代码会导致死循环 
//    //NSLog(@"%@", self);
//    
//    return [NSString stringWithFormat:@"age=%d, name=%@", _age, _name];
//    
//    //return @"";
//}

// 决定了类对象的输出结果
+ (NSString *)description
{
    
    return @"abd";
}
@end
