//
//  Person+Xxm.m
//  08-类的本质
//
//  Created by tom-pc on 15/9/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person+Xxm.h"

@implementation Person (Xxm)
+ (void)load
{
    NSLog(@"Person(Xxm)----load");
}

+ (void)initialize
{
    NSLog(@"Person(Xxm)---initialize");
}
@end
