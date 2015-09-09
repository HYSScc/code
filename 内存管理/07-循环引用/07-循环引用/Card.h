//
//  Card.h
//  07-循环引用
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Card : NSObject
@property ( nonatomic, assign) Person *person;
@end
