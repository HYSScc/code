//
//  GroupBuyingCell.m
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "GroupBuyingCell.h"
#import "GroupBuyingModel.h"

@implementation GroupBuyingCell
- (void)setGroupBuyingModel:(GroupBuyingModel *)groupBuyingModel
{
    _groupBuyingModel = groupBuyingModel;
    
    // 设置内容
    self.titleLabel.text = groupBuyingModel.title;
    self.iconView.image = [UIImage imageNamed:groupBuyingModel.icon];
    
    //    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@         已有%@购买", gbm.price, gbm.buyCount];
    self.priceLabel.text = groupBuyingModel.price;
    self.buyCountLabel.text = groupBuyingModel.buyCount;
}
@end
