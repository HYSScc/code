//
//  Question.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "Question.h"

@implementation Question
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
        [self setValuesForKeysWithDictionary:dict];
        
        // 对备选区按钮进行乱序
        [self randamOptions];
    }
    return self;
}

+ (instancetype)questionModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)questionModel
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionModelWithDict:dict]];
    }
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"=<%@: %p> {answer: %@, icon: %@, title: %@, options: %@}", self.class, self, self.answer, self.icon,self.title, self.options];
}

- (void)randamOptions
{
    // 对option乱序
    self.options = [self.options sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        }else{
            return [str2 compare:str1];
        }
    }];
}

@end
