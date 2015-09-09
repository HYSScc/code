//
//  Person.h
//  10-ARC的基本使用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

@interface Person : NSObject
@property (nonatomic, strong) Dog *dog;
@end
