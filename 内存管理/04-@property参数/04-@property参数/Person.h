//
//  Person.h
//  04-@property参数
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject

@property int age;

// retain ： 生成的set方法里面，release旧值，retain新值
@property (retain) Book *book;

@property (retain) NSString *name;
@end
