//
//  Person.h
//  05-自定义构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString *name;
@property int age;
/*
 自定义构造方法的规范
 1.一定是对象方法，一定以 - 开头
 2.返回值一般是id类型
 3.方法名一般以init开头
*/

- (id)initWithName:(NSString *)name;
- (id)initWithAge:(int)age;
- (id)initWithName:(NSString *)name andAge:(int)age;
@end
