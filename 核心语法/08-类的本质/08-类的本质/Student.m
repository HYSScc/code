//
//  Student.m
//  08-类的本质
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Student.h"

@implementation Student
+ (void)load
{
    NSLog(@"Student----load");
}

+ (void)initialize
{
    NSLog(@"Student---initialize");
}
@end
