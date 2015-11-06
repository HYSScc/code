//
//  MicroblogCell.m
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MicroblogCell.h"
#import "MicroblogStatusModel.h"
#import "MicroblogFrameModel.h"


#define kNameFont [UIFont systemFontOfSize:14]
#define kTextFont [UIFont systemFontOfSize:16]

@interface MicroblogCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *vipView;
@property (nonatomic, strong) UILabel *textLab;
@property (nonatomic, strong) UIImageView *pictureView;
@end

@implementation MicroblogCell

- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = kNameFont;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UIImageView *)vipView
{
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = YES;
        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

- (UILabel *)textLab
{
    if (_textLab == nil) {
        _textLab = [[UILabel alloc] init];
        _textLab.font = kTextFont;
        _textLab.numberOfLines = 0;
        [self.contentView addSubview:_textLab];
    }
    return _textLab;
}

- (UIImageView *)pictureView
{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}

- (void)setMicroblogFrameModel:(MicroblogFrameModel *)microblogFrameModel
{
    _microblogFrameModel = microblogFrameModel;
    
    [self settingData];
    [self settingFrame];
}

- (void)settingData
{
    MicroblogStatusModel *microblogModel = self.microblogFrameModel.microblogStatusModel;
    // 头像
    self.iconView.image = [UIImage imageNamed:microblogModel.icon];
    
    // 姓名
    self.nameLabel.text = microblogModel.name;
    
    // vip
    if (microblogModel.vip == IsMicroblog) {
//        self.vipView.image = [UIImage imageNamed:@"vip"];
        self.vipView.hidden = NO;
        
    } else
    {
        self.vipView.hidden = YES;
    }
    
    // 正文
    self.textLab.text = microblogModel.text;
    
    // 配图
    if (microblogModel.picture.length > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:microblogModel.picture];
    } else{
        self.pictureView.hidden = YES;
    }
}

- (void)settingFrame
{
    self.iconView.frame = self.microblogFrameModel.iconF;
    
    self.nameLabel.frame = self.microblogFrameModel.nameF;
    
    self.vipView.frame = self.microblogFrameModel.vipF;
    
    self.textLab.frame = self.microblogFrameModel.textF;
    
    if (self.microblogFrameModel.microblogStatusModel.picture.length > 0 ) {
        self.pictureView.frame = self.microblogFrameModel.pictureF;
    }
}
@end
