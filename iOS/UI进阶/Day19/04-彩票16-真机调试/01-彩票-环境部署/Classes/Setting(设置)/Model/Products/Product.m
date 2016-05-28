//
//  Product.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "Product.h"

@implementation Product

// 解决json文件中 文件名无法解析
- (void)setIcon:(NSString *)icon
{
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
//        // KVC
//        [self setValuesForKeysWithDictionary:dict];
        
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.url = dict[@"url"];
        self.customUrl = dict[@"customUrl"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)productsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)products
{
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in jsonArray) {
        [arrayM addObject:[Product productsWithDict:dict]];
    }
    return arrayM;
}

@end
