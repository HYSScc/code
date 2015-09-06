//
//  Student.m
//  01-成员变量作用域
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)study
{
    //_height = 10;
    [self setHeight:10];
    int h = [self height];
    
    _weight = 50;
    
}
@end
