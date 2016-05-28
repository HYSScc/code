//
//  SettingLabelItem.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingLabelItem.h"

#import "SaveTool.h"

@implementation SettingLabelItem

// 数据存储封装在setter方法中
- (void)setText:(NSString *)text
{
    _text = text;
    
    // 调用Tool实现数据存储和同步
    [SaveTool setObject:text forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    // title是父类中的属性
    [super setTitle:title];
    
    // 取出设置的数据
    _text = [SaveTool objectForKey:self.title];
}

@end
