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

@interface SettingTableViewController()

@property (nonatomic, strong) NSMutableArray *dataList; // 声明可变数组接收模型数据

@end

@implementation SettingTableViewController
// 重写init方法
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped]; // 清除原有数据
}

// 懒加载
- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
        
        // 第0组
        SettingItem *pushNotice = [SettingItem settingItemWithIcon:@"MorePush" title:@"推送和提醒"];
        SettingItem *yaoyiyao = [SettingItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"];
        
        SettingGroup *group0 = [[SettingGroup alloc] init];
        group0.items = @[pushNotice, yaoyiyao];
        
        group0.header = @"";
        group0.footer = @"";
        
        // 第1组
        SettingItem *newVersion = [SettingItem settingItemWithIcon:@"MoreUpdate" title:@"检测新版本"];
        SettingItem *help = [SettingItem settingItemWithIcon:@"MoreHelp" title:@"帮助"];
        
        SettingGroup *group1 = [[SettingGroup alloc] init];
        group1.items = @[newVersion, help];
        
        group1.header = @"";
        group1.footer = @"";
        
        [_dataList addObject:group0];
        [_dataList addObject:group1];
    }
    return _dataList;
}

#pragma mark - 数据源方法
// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}
// 每组的行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGroup *group = self.dataList[section];
    return group.items.count;
}
// 单元格细节
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    SettingGroup *group = self.dataList[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:item.icon];
    cell.textLabel.text = item.title;
    
    return cell;
}
@end
