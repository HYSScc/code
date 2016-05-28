//
//  SettingCell.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingItem;

@interface SettingCell : UITableViewCell

@property (nonatomic, strong) SettingItem *item; // 声明模型

+ (instancetype)cellWithTableView:(UITableView *)tableView; // 类方法创建cell

@end
