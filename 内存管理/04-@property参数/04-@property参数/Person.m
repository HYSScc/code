//
//  Person.m
//  04-@property参数
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
//- (void)setBook:(Book *)book
//{
//    if (_book != book)
//    {
//        [_book release];
//        _book = [book retain];
//    }
//}


- (void)dealloc
{
    
    [_book release];
    [_name release];
    [super dealloc];
}
@end
