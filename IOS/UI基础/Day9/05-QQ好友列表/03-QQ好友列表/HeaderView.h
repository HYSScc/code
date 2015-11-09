//
//  HeaderView.h
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroup;
// 定义block
typedef void(^HeaderViewBlock)(id);

// 代理协议
@class HeaderView;
@protocol HeaderViewDelegate <NSObject>
- (void)headerView:(HeaderView *)view;
@end

@interface HeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWith:(UITableView *)tableView;
// 模型
@property (nonatomic, strong) FriendGroup *group;
// 代理属性
@property (nonatomic, assign) id<HeaderViewDelegate> delegate;
// block属性
@property (nonatomic, copy) HeaderViewBlock block;
@end
