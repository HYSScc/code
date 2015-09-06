//
//  Student.m
//  04-构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Student.h"

@implementation Student

// 学生对象初始化完毕后，年龄就是10，学号就是1

- (instancetype)init
{
    if (self = [super init])
    {
        _no = 1;
    }
    return self;
}

@end
