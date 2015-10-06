//
//  Question.h
//  01-超级猜图
//
//  Created by tom-pc on 15/10/4.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary *)dict;

/** 返回所有题目数组 */
+ (NSArray *)questions;

/** 打乱备选文字的数组 */
- (void)randamOptions;

@end
