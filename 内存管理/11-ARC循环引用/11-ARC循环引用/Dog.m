//
//  Dog.m
//  11-ARC循环引用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)dealloc
{
    NSLog(@"Dog is dealloc");
}
@end
