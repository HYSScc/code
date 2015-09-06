//
//  Person.h
//  00-点语法
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}
- (void)setAge:(int)age;
- (int)age;
@end
