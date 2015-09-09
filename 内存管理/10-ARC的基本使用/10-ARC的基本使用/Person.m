//
//  Person.m
//  10-ARC的基本使用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    
    
    NSLog(@"Person is dealloc");
    
    //[super dealloc];
}
@end
