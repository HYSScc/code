//
//  Person.h
//  09-autorelease的应用
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, assign) int age;

+ (id)person;

+ (id)personWithAge:(int)age;
@end
