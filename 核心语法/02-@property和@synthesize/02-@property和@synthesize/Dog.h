//
//  Dog.h
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
@property int age; // 生成setter和getter方法的实现和生命，还生成_age这个成员变量，默认生成成员变量是私有的。
@end
