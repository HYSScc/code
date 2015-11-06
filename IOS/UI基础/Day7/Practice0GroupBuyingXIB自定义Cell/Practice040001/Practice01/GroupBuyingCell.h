//
//  GroupBuyingCell.h
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupBuyingModel;

@interface GroupBuyingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

// 声明数据模型
@property (strong, nonatomic) GroupBuyingModel *groupBuyingModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
