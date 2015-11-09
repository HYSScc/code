//
//  appsCell.m
//  06-应用程序管理 cell的重用
//
//  Created by tom-pc on 15/11/9.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "appsCell.h"
#import "CZAppsModel.h"

@interface appsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imagView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@end

@implementation appsCell

+ (instancetype)appsCellWithTableView:(UITableView *)tableView
{
    return [tableView dequeueReusableCellWithIdentifier:@"apps"];
}

- (void)setModel:(CZAppsModel *)model
{
    _model = model;
    
    // 当cell重用的时候，应该注意。在重用cell的时候，应该改变cell的所有控件的状态
    // 1.首先是按钮可点还是不可点。
    
    self.nameLabel.text = model.name;
    self.imageView.image = [UIImage imageNamed:model.icon];
    self.introLabel.text = [NSString stringWithFormat:@"%@|%@", model.size, model.download];
    
    // 判断isDownload的状态，然后修改button的状态
    self.loadButton.enabled = (model.isDownload == NO);
}
// 按钮点击
- (IBAction)downloadClick:(id)sender {
    self.loadButton.enabled = NO;
    
    // 代表已下载
    self.model.isDownload = YES;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
