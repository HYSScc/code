//
//  Student.h
//  05-自定义构造方法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property int no;

- (id)initWithNo:(int)no;
- (id)initWithNo:(int)no andName:(NSString *)name andAge:(int)age;
@end
