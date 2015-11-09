//
//  HeaderView.h
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroup;
@interface HeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWith:(UITableView *)tableView;

@property (nonatomic, strong) FriendGroup *group;
@end
