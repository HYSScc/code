//
//  Car.h
//  03-set方法的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

{
    int _speed;
}

- (void)setSpeed:(int)speed;
- (int)speed;

@end
