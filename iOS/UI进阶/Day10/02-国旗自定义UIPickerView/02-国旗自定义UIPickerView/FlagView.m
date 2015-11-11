//
//  FlagView.m
//  02-国旗自定义UIPickerView
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "FlagView.h"
#import "FlagModel.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation FlagView
+ (instancetype)flagView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
}

- (void)setModel:(FlagModel *)model
{
    _model = model;
    
    // 1.设置name
    self.nameLabel.text = model.name;
    
    // 2.设置图片
    self.iconImage.image = [UIImage imageNamed:model.icon];
}
@end
