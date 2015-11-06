//
//  Question.m
//  01-超级猜图
//
//  Created by tom-pc on 15/10/4.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Question.h"

@implementation Question

// 在成员方法中，如果给self赋值，只能在initXXX方法中进行
// 苹果语法约定：
// 1> 所有的方法首字母要小写
// 2> 当单词切换的时候，单词首字母大写（驼峰法）
// 3> 类名要大写
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)questions
{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return arrayM;
}

// 对象描述方法，类似java中的toString()，便于跟踪调试
// 建议：如果是自定义的模型，最好编写description方法，可以方便调试
- (NSString *)description
{
    return [NSString stringWithFormat:@"=<%@: %p> {answer: %@, icon: %@, title: %@, options: %@}", self.class, self, self.answer, self.icon,self.title, self.options];
}
@end
