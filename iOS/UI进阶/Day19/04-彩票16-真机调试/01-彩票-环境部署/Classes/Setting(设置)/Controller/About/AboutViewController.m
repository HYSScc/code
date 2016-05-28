//
//  AboutViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "AboutViewController.h"

#import "SettingArrowItem.h"
#import "SettingGroup.h"

#import "AboutHeaderView.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
    
    self.tableView.tableHeaderView = [AboutHeaderView headerView];
    
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, 320, 180);
}

- (void)addGroup0
{
    SettingArrowItem *p = [SettingArrowItem settingItemWithIcon:nil title:@"评分支持"]; // 多态
    SettingArrowItem *kefu = [SettingArrowItem settingItemWithIcon:nil title:@"客服电话"]; // 多态
    kefu.subTitle = @"020-8567897667";
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.items = @[p, kefu];
    
    [self.dataList addObject:group0];
}

@end
