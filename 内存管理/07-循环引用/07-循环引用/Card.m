//
//  Card.m
//  07-循环引用
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Card.h"
#import "Person.h"

@implementation Card

- (void)dealloc
{
    NSLog(@"Car被销毁");
    
    //[_person release];
    
    [super dealloc];
}

@end
