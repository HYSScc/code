//
//  appsCell.h
//  06-应用程序管理 cell的重用
//
//  Created by tom-pc on 15/11/9.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZAppsModel;
@interface appsCell : UITableViewCell
// 初始化cell
+ (instancetype)appsCellWithTableView:(UITableView *)tableView;
// 模型
@property (nonatomic, strong) CZAppsModel *model;
@end
