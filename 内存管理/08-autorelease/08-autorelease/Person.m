//
//  Person.m
//  08-autorelease
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"Person被销毁");
    [super dealloc];
}
@end
