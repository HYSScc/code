//
//  MessageCell.h
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/27.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageFrameModel;
@interface MessageCell : UITableViewCell
// cell的类方法
+ (instancetype)messageCellWithTableView:(UITableView *)tableView;
// frame的模型
@property (nonatomic, strong) MessageFrameModel *messageFrameModel;
@end
