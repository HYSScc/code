//
//  Book.h
//  02-多个对象之间的内存管理
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    int _price;
}
- (void)setPrice:(int)price;
- (int)price;
@end
