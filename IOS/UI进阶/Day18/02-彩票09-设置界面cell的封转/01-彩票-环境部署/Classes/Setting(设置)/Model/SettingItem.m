//
//  SettingItem.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title
{
    SettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    item.title = title;
    
    return item;
}

//- (instancetype)initWithDict:(NSDictionary *)dict
//{
//    self = [super init];
//    if (self) {
//        // KVC
//        [self setValuesForKeysWithDictionary:dict];
//    }
//    return self;
//}
//
//+ (instancetype)<#classFunc#>
//{
//    return [[self alloc] initWithDict:dict];
//}
//
//+ (NSArray *)<#arrayFunc#>
//{
//    
//    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"<#fileName#>.plist" ofType:nil]];
//    
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (NSDictionary *dict in array) {
//        [arrayM addObject:[self <#classFunc#>]];
//    }
//    return arrayM;
//}


@end
