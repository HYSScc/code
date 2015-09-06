//
//  Student.m
//  05-自定义构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Student.h"

@implementation Student
- (id)initWithNo:(int)no
{
    if ( self = [super init] )
    {
        _no = no;
    }
    return self;
}

//- (id)initWithNo:(int)no andName:(NSString *)name andAge:(int)age
//{
//    if ( self = [super init])
//    {
//        _no = no;
//        self.name = name; // [self setName:name]; // [super setName:name];
//        self.age = age;
//    }
//    return self;
//}

// 父类的属性交给父类方法去处理，子类方法处理子类自己的属性
- (id)initWithNo:(int)no andName:(NSString *)name andAge:(int)age
{
    if ( self = [super initWithName:name andAge:age] )
    {
        _no = no;
    }
    return self;
}


@end
