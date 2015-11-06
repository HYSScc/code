//
//  MessageCell.m
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/27.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageCell.h"
#import "MessageFrameModel.h"
#import "MessageModel.h"
#import "Constant.h"
#import "UIImage+Resizeimage.h"

@interface MessageCell()
@property (nonatomic, weak) UILabel *time;
@property (nonatomic, weak) UIButton *textView;
@property (nonatomic, weak) UIImageView *icon;
@end

@implementation MessageCell

+ (instancetype)messageCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"messageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.时间
        UILabel *time = [[UILabel alloc] init];
        time.textAlignment = NSTextAlignmentCenter; // 垂直居中，后添加
        time.font = [UIFont systemFontOfSize:13.0f];// 字体大小，后添加
        [self.contentView addSubview:time];
        self.time = time;
        // 2.正文
        UIButton *textView = [[UIButton alloc] init];
//        textView.backgroundColor = [UIColor grayColor];// 背景色，后添加
        textView.titleLabel.font = xBtnFont; // 字体大小，后添加
        textView.titleLabel.numberOfLines = 0; // 自动换行
        textView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20); // 内边距
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:textView];
        self.textView = textView;
        // 3.用户头像
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        self.icon = icon;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMessageFrameModel:(MessageFrameModel *)messageFrameModel
{
    _messageFrameModel = messageFrameModel;
    
    MessageModel *model = messageFrameModel.messageModel;
    
    // 1.时间
    self.time.frame = messageFrameModel.timeF;
    self.time.text = model.time;
    // 2.头像
    self.icon.frame = messageFrameModel.iconF;
    if (model.type == MessageModelG) {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
    } else
    {
        self.icon.image = [UIImage imageNamed:@"Jobs"];
    }
    
    // 3.正文(button类型)
    self.textView.frame = messageFrameModel.textViewF;
    [self.textView setTitle:model.text forState:UIControlStateNormal];
    
    if (model.type == MessageModelG) {
        [self.textView setBackgroundImage:[UIImage resizeWithImageName:@"chat_send_nor"] forState:UIControlStateNormal];
    } else
    {
        [self.textView setBackgroundImage:[UIImage resizeWithImageName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
}

// 返回一个可拉伸的图片


@end
