//
//  ShareViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ShareViewController.h"

#import "SettingGroup.h"
#import "SettingArrowItem.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
}

- (void)addGroup0
{
    SettingArrowItem *sina = [SettingArrowItem settingItemWithIcon:@"WeiboSina" title:@"新浪分享"]; // 多态
    SettingArrowItem *message = [SettingArrowItem settingItemWithIcon:@"SmsShare" title:@"短信分享"]; // 多态
    SettingArrowItem *mail = [SettingArrowItem settingItemWithIcon:@"MailShare" title:@"邮件分享"]; // 多态
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.items = @[sina, message, mail];
    
    [self.dataList addObject:group0];
}

@end
