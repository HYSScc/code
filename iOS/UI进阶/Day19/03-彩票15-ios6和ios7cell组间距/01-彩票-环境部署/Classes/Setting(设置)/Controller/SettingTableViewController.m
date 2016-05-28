//
//  SettingTableViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingTableViewController.h"

#import "SettingItem.h"

#import "SettingGroup.h"

#import "SettingCell.h"

#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"

#import "TestViewController.h"

#import "MBProgressHUD+MJ.h"

#import "ProductCollectionViewController.h"

#import "PushNoticeController.h"

#import "HelpController.h"

#import "ShareViewController.h"

#import "AboutViewController.h"

@interface SettingTableViewController()

@end

@implementation SettingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 第0组
    [self addGroup0];
    
    // 第1组
    [self addGroup1];
    
}

- (void)addGroup0
{
    // 第0组
    //        SettingItem *pushNotice = [SettingItem settingItemWithIcon:@"MorePush" title:@"推送和提醒"];
    //        SettingItem *yaoyiyao = [SettingItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"];
    SettingArrowItem *pushNotice = [SettingArrowItem settingItemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[PushNoticeController class]]; // 多态
    
    SettingItem *yaoyiyao = [SettingSwitchItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"]; // 多态
    SettingItem *sound = [SettingSwitchItem settingItemWithIcon:@"sound_Effect" title:@"声音效果"]; // 多态
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.header = @"功能";
    group0.footer = @"";
    
    group0.items = @[pushNotice, yaoyiyao, sound];
    
    [self.dataList addObject:group0];
}

- (void)addGroup1
{
    // 第1组
    SettingItem *newVersion = [SettingArrowItem settingItemWithIcon:@"MoreUpdate" title:@"检测新版本"];
    // 保存了一段检查更新的功能
    newVersion.option = ^{ // 定义block
        // 1.显示蒙版
        [MBProgressHUD showMessage:@"玩命检查中"];
        // 延迟0.5
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 2.隐藏蒙版
            [MBProgressHUD hideHUD];
            // 3.提示用户
            UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"有新版本" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alertcontroller addAction:[UIAlertAction actionWithTitle:@"取消"
                                                                style:UIAlertActionStyleCancel
                                                              handler:nil]];
            [alertcontroller addAction:[UIAlertAction actionWithTitle:@"确定"
                                                                style:UIAlertActionStyleDestructive
                                                              handler:^(UIAlertAction *action) {
                                                                  NSLog(@"Action 2 Handler Called");
                                                              }]];
            // 显示
            [self presentViewController:alertcontroller animated:YES completion:nil];
        });
        
    };
    SettingArrowItem *help = [SettingArrowItem settingItemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[HelpController class]];
    SettingArrowItem *share = [SettingArrowItem settingItemWithIcon:@"MoreShare" title:@"分享" destVcClass:[ShareViewController class]];
    SettingArrowItem *message = [SettingArrowItem settingItemWithIcon:@"MoreMessage" title:@"查看信息" destVcClass:[TestViewController class]];
    SettingArrowItem *netease = [SettingArrowItem settingItemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ProductCollectionViewController class]];
    SettingArrowItem *about = [SettingArrowItem settingItemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[AboutViewController class]];
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    
    group1.header = @"帮助";
    group1.footer = @"";
    
    group1.items = @[newVersion, help, share, message, netease, about];

    [self.dataList addObject:group1];
}

@end
