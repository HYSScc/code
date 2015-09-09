//
//  Person.m
//  07-循环引用
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"
#import "Card.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"Person被销毁");
    
    [_card release];
    [super dealloc];
}
@end
