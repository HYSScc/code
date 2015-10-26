//
//  tgCell.h
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tg;
@interface tgCell : UITableViewCell

// 定义一个团购的数据模型
@property (nonatomic, strong) Tg *tg;

// 提供一个类方法，可以快速创建Cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
