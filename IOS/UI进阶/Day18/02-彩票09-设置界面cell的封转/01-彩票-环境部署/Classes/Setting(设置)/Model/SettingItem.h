//
//  SettingItem.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 枚举创建cell右边图标
//typedef enum : NSUInteger {
//    SettingItemTypeArrow,
//    SettingItemTypeSwitch,
//} SettingItemType; // 枚举最好以自己类名开头

@interface SettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

//@property (nonatomic, assign) SettingItemType type; 

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title;

@end
