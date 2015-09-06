//
//  Car.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Car.h"

@implementation Car
// 会访问_speed这个成员变量，如果不存在，就会自动生成@private类型的_speed变量
@synthesize speed = _speed, wheels = _wheels;

- (void)test
{
    NSLog(@"速度=%d", _speed);
}
@end
