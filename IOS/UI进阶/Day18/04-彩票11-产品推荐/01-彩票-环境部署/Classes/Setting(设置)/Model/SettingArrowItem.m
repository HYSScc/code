//
//  SettingArrowItem.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    SettingArrowItem *item = [super settingItemWithIcon:icon title:title];
    
    item.destVcClass = destVcClass;
    
    return item;
}

@end
