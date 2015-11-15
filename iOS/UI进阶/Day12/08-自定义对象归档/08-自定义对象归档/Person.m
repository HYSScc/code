//
//  Person.m
//  08-自定义对象归档
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "Person.h"

@implementation Person
// 在对象归档的时候调用
// 哪些需要归档，这些属性怎么归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{   // 键值归档
    [aCoder encodeInt:_age forKey:@"age"];
}


// 在对象解档的时候调用
// 哪些需要解档，这些属性怎么解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{   // 当父类实现了NSCoding，就能调用 [super initWithCoder]
    if (self = [super init] ) {
        _age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}
@end
