//
//  Person.h
//  07-循环引用
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
// @class仅仅是告诉编译器，Card是一个类
@class Card;

@interface Person : NSObject
@property ( nonatomic, retain) Card *card;
@end
