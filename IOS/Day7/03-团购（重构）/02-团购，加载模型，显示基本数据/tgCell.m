//
//  tgCell.m
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "tgCell.h"
#import "Tg.h"

@interface tgCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation tgCell

- (void)setTg:(Tg *)tg
{
    // setter方法中，第一句要赋值,否则要在其他方法中使用模型，将无法访问到
    _tg = tg;
    
    self.titleLabel.text = tg.title;
    self.iconView.image = [UIImage imageNamed:tg.icon];
    self.priceLabel.text = tg.price;
    self.buyCountLabel.text = tg.buyCount;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 1. 可重用标示符
    NSString *ID = @"Cell";
    // 2. tableView查询可重用Cell
    tgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3. 如果没有可重用Cell
    if (cell == nil) {
        NSLog(@"加载XIB");
        // 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"tgCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

// 从XIB被加载之后，会自动被调用，如果使用纯代码，不会被执行
- (void)awakeFromNib {
    // Initialization code
}

// Cell被选中或者取消选中时都会被调用
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
