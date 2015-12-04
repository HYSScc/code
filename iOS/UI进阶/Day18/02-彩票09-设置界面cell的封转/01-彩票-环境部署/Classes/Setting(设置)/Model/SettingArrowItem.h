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

@property (nonatomic, copy) NSString *destVcName; // 根据控制器名字去跳转

@end
