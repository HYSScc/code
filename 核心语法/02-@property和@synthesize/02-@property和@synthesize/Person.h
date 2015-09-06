//
//  Person.h
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    int age;
    int _height;
    double _weight;
    NSString *_name;
}
// @property：可以自动生成某个成员变量的setter和getter方法
@property int age;
@property int height;
@property double weight;
@property NSString *name;
- (void)test;
@end
