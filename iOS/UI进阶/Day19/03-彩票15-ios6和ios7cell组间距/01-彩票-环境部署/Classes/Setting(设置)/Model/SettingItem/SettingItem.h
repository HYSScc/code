//
//  SettingItem.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 枚举创建cell右边图标 后用创建两个模型代替此方法
//typedef enum : NSUInteger {
//    SettingItemTypeArrow,
//    SettingItemTypeSwitch,
//} SettingItemType; // 枚举最好以自己类名开头

// 定义block
typedef void(^SettingItemOption)();

@interface SettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *subTitle; // 添加子标题

// 保存一段功能，在恰当的时候调用
@property (nonatomic, copy) SettingItemOption option;

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title;

@end
