//
//  ContactCell.h
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;
@interface ContactCell : UITableViewCell
@property (nonatomic, strong) Contact *contact;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
