//
//  SettingArrowItem.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingItem.h"

@interface SettingArrowItem : SettingItem

// 调整的控制器的类名
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
