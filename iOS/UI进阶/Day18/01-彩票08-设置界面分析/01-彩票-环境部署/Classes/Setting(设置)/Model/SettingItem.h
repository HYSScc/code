//
//  SettingItem.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title;

@end
