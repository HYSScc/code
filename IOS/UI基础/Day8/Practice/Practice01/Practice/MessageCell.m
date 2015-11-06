//
//  MessageCell.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageCell.h"
@interface MessageCell ()
@property (nonatomic, weak) UILabel *time;
@property (nonatomic, weak) UIButton *textViewBtn;
@property (nonatomic, weak) UIImageView *icon;
@end
@implementation MessageCell
+ (instancetype)messageCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]; // tableView查找是否有存在的cell
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    // 前面初始化父类，如果对象初始化成功，才有必要进行接下来的初始化
    if (self) {
        // 1.时间
        UILabel *time = [[UILabel alloc] init];
        [self.contentView addSubview:time];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.time = time;
        // 2.正文
        UIButton *textViewBtn = [[UIButton alloc] init];
        [self.contentView addSubview:textViewBtn];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.textViewBtn = textViewBtn;
        // 3.头像
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.icon = icon;
    }
    return self;
}
@end
