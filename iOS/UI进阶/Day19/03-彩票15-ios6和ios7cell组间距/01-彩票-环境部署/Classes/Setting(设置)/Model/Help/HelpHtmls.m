//
//  HelpHtmls.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "HelpHtmls.h"

@implementation HelpHtmls

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC
//        [self setValuesForKeysWithDictionary:dict];
        
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)helpHtmlsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)helpHtmls
{
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in jsonArray) {
        [arrayM addObject:[HelpHtmls helpHtmlsWithDict:dict]];
    }
    return arrayM;
}


@end
