
//
//  Person.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize age = _age;
@synthesize height = _height;
@synthesize weight = _weight;
@synthesize name = _name;
- (void)test
{
    NSLog(@"age=%i, _age=%i", age, _age);
}
@end
