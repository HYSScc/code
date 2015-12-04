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
//        SettingItem *pushNotice = [SettingItem settingItemWithIcon:@"MorePush" title:@"推送和提醒"];
//        SettingItem *yaoyiyao = [SettingItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"];
        SettingArrowItem *pushNotice = [SettingArrowItem settingItemWithIcon:@"MorePush" title:@"推送和提醒"]; // 多态
        pushNotice.destVcClass = [TestViewController class]; // 给属性赋值 跳转用
        pushNotice.destVcName = @"TestViewController"; // 给属性赋值 跳转用 方法二
        SettingItem *yaoyiyao = [SettingSwitchItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"]; // 多态
        
        SettingGroup *group0 = [[SettingGroup alloc] init];
        
        group0.header = @"功能";
        group0.footer = @"";

        group0.items = @[pushNotice, yaoyiyao];
        
        
        // 第1组
        SettingItem *newVersion = [SettingArrowItem settingItemWithIcon:@"MoreUpdate" title:@"检测新版本"];
        SettingItem *help = [SettingArrowItem settingItemWithIcon:@"MoreHelp" title:@"帮助"];
        
        SettingGroup *group1 = [[SettingGroup alloc] init];
        
        group1.header = @"帮助";
        group1.footer = @"";
        
        group1.items = @[newVersion, help];
        
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
//    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
    // 1.创建cell
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    
    // 2.取出模型
    SettingGroup *group = self.dataList[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
//    cell.imageView.image = [UIImage imageNamed:item.icon];
//    cell.textLabel.text = item.title;
    // 3.传递模型
    cell.item = item;
    
    return cell;
}
// cell header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SettingGroup *group = self.dataList[section];
    return group.header;
}
// 监听点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取出模型
    SettingGroup *group = self.dataList[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    if ([item isKindOfClass:[SettingArrowItem class]]) { // 需要跳转控制器
        SettingArrowItem *arrowItem = (SettingArrowItem *)item; // 强转一下类型
        
        // 通过字符串创建 方法二
        // 反编译
        Class vcClass = NSClassFromString(arrowItem.destVcName);
        
        // 创建跳转的控制器
        UIViewController *vc = [[vcClass alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
@end
