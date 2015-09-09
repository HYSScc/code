//
//  Book.m
//  02-多个对象之间的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Book.h"

@implementation Book
- (void)setPrice:(int)price
{
    _price = price;
}

- (int)price
{
    return _price;
}

- (void)dealloc
{
    
    NSLog(@"Book对象被回收");
    
    [super dealloc];
}
@end
