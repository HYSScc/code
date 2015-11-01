//
//  MessageModel.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init]; // 调用父类
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageModelWithDict:(NSDictionary *)dict
{
    return [[MessageModel alloc] initWithDict:dict];
}

+ (NSMutableArray *)messageModel
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]]; // 拿到数据
    NSMutableArray *arrayM = [NSMutableArray array]; // 创建可变数组
    //从plist文件的数组中，拿出每一个字典进行循环 KVC 赋值，并且放入到一个新的可变数组中，然后返回
    for (NSDictionary *dict in array) {
        [arrayM addObject:[MessageModel messageModelWithDict:dict]];
    }
    return arrayM;
}
@end
