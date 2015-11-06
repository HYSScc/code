//
//  MessageCell.h
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageFrameModel.h"

@interface MessageCell : UITableViewCell
// Frame模型的声明
@property (nonatomic, strong) MessageFrameModel *messageFrameModel;
// 实例化cell的类方法
+ (instancetype)messageCellWithTableView:(UITableView *)tableView;
@end
