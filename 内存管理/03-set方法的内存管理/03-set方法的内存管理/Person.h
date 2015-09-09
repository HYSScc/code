//
//  Person.h
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject
{
    Car *_car;
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

- (void)setCar:(Car *)car;
- (Car *)car;

@end
