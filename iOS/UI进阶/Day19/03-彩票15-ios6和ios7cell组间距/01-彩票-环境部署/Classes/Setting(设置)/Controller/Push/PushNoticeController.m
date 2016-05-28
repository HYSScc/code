//
//  PushNoticeController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "PushNoticeController.h"

#import "SettingItem.h"

#import "SettingGroup.h"

#import "SettingCell.h"

#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"

#import "TestViewController.h"

#import "MBProgressHUD+MJ.h"

#import "ProductCollectionViewController.h"

#import "ScoreTableViewController.h"

@interface PushNoticeController ()

@end

@implementation PushNoticeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 第0组
    [self addGroup0];
}

- (void)addGroup0
{
    // 第0组
    SettingArrowItem *push = [SettingArrowItem settingItemWithIcon:nil title:@"开奖号码推送" destVcClass:nil]; // 多态
    SettingArrowItem *animation = [SettingArrowItem settingItemWithIcon:nil title:@"中奖动画" destVcClass:nil]; // 多态
    SettingArrowItem *score = [SettingArrowItem settingItemWithIcon:nil title:@"比分直播提醒" destVcClass:[ScoreTableViewController class]]; // 多态
    SettingArrowItem *timer = [SettingArrowItem settingItemWithIcon:nil title:@"购彩定时提醒" destVcClass:nil]; // 多态
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    //        group0.header = @"功能";
    //        group0.footer = @"";
    
    group0.items = @[push, animation, score, timer];
    
    [self.dataList addObject:group0];
}
@end
