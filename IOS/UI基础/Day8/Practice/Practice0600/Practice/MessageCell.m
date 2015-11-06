//
//  MessageCell.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageCell.h"
#import "MessageFrameModel.h"
#import "MessageModel.h"
#import "Constant.h"

@interface MessageCell ()
// cell中的time控件
@property (nonatomic, weak) UILabel *time;
// cell中的正文控件
@property (nonatomic, weak) UIButton *textViewBtn;
// cell中的头像控件
@property (nonatomic, weak) UIImageView *icon;
@end
@implementation MessageCell
// cell的类方法实例化
+ (instancetype)messageCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]; // tableView查找是否有存在的cell
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

// 控件的初始化，加入到cell的contentView
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    // 前面初始化父类，如果对象初始化成功，才有必要进行接下来的初始化
    if (self) {
        // 1.时间
        UILabel *time = [[UILabel alloc] init];
        time.textAlignment = NSTextAlignmentCenter; // 设置垂直居中
        time.font = [UIFont systemFontOfSize:13.0f]; // 设置字体大小
        [self.contentView addSubview:time];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.time = time;
        // 2.正文
        UIButton *textViewBtn = [[UIButton alloc] init];
//        textViewBtn.backgroundColor = [UIColor grayColor]; // 设置背景颜色
        textViewBtn.titleLabel.font = xBtnFont; // 设置字体大小
        textViewBtn.titleLabel.numberOfLines = 0; // 设置自动换行
        textViewBtn.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20); // 设置内边距
        [textViewBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:textViewBtn];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.textViewBtn = textViewBtn;
        // 3.头像
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        //   关键一步：先将初始化的对象添加到cell中，在将初始化的对象赋值给声明的属性
        self.icon = icon;
        
        // 清除cell的颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// messageFrameModel的setter方法设置位置和内容
- (void)setMessageFrameModel:(MessageFrameModel *)messageFrameModel
{
    _messageFrameModel = messageFrameModel;
    
    // 实例化设置好位置的模型，为了设置控件的内容
    MessageModel *model = messageFrameModel.messageModel;
    
    // 1.时间
    //   设置位置
    self.time.frame = messageFrameModel.timeF;
    //   设置时间
    self.time.text = model.time;
    
    // 2.头像
    self.icon.frame = messageFrameModel.iconF;
    if (model.type == MessageModelG) {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
    }else
    {
        self.icon.image = [UIImage imageNamed:@"Jobs"];
    }
    
    // 正文
    self.textViewBtn.frame = messageFrameModel.textViewBtnF;
    [self.textViewBtn setTitle:model.text forState:UIControlStateNormal];
    
    if (model.type == MessageModelG) {
        [self.textViewBtn setBackgroundImage:[self resizeWithImageName:@"chat_send_nor"] forState:UIControlStateNormal];
    }else
    {
        [self.textViewBtn setBackgroundImage:[self resizeWithImageName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
}

- (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat w = normal.size.width * 0.5f;
    CGFloat h = normal.size.height * 0.5f;
    
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
@end
