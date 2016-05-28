//
//  SaveTool.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SaveTool.h"

@implementation SaveTool

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    // 存储数据
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    // 同步
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)defaultName
{
    // 取出存储的数据
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end
