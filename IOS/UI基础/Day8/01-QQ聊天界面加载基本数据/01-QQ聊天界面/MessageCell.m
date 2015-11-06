//
//  MessageCell.m
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/27.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageCell.h"
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
        time.frame = CGRectMake(20, 20, 20, 20);
        time.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:time];
        self.time = time;
        // 2.正文
        UIButton *textView = [[UIButton alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        // 3.用户头像
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        self.icon = icon;
    }
    return self;
}

@end
