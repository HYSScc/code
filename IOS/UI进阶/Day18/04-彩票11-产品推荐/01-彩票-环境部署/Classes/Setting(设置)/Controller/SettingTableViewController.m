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
        SettingArrowItem *pushNotice = [SettingArrowItem settingItemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[TestViewController class]]; // 多态
        
        SettingItem *yaoyiyao = [SettingSwitchItem settingItemWithIcon:@"handShake" title:@"摇一摇机选"]; // 多态
        SettingItem *sound = [SettingSwitchItem settingItemWithIcon:@"sound_Effect" title:@"声音效果"]; // 多态
        
        SettingGroup *group0 = [[SettingGroup alloc] init];
        
        group0.header = @"功能";
        group0.footer = @"";

        group0.items = @[pushNotice, yaoyiyao, sound];
        
        
        // 第1组
        SettingItem *newVersion = [SettingArrowItem settingItemWithIcon:@"MoreUpdate" title:@"检测新版本"];
        // 保存了一段检查更新的功能
        newVersion.option = ^{ // 定义block
            // 1.显示蒙版
            [MBProgressHUD showMessage:@"玩命检查中---"];
            // 延迟0.5
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 2.隐藏蒙版
                [MBProgressHUD hideHUD];
                // 3.提示用户
                UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"有新版本" message:@"啦啦啦啦" preferredStyle:UIAlertControllerStyleAlert];
                [alertcontroller addAction:[UIAlertAction actionWithTitle:@"Action 1 (Default Style)"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            NSLog(@"Action 1 Handler Called");
                                                        }]];
                [alertcontroller addAction:[UIAlertAction actionWithTitle:@"Action 2 (Cancel Style)"
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction *action) {
                                                            NSLog(@"Action 2 Handler Called");
                                                        }]];
                // 显示
                [self presentViewController:alertcontroller animated:YES completion:nil];
            });
        
        };
        SettingArrowItem *help = [SettingArrowItem settingItemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[TestViewController class]];
        SettingArrowItem *share = [SettingArrowItem settingItemWithIcon:@"MoreShare" title:@"分享" destVcClass:[TestViewController class]];
        SettingArrowItem *message = [SettingArrowItem settingItemWithIcon:@"MoreMessage" title:@"查看信息" destVcClass:[TestViewController class]];
        SettingArrowItem *netease = [SettingArrowItem settingItemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ProductCollectionViewController class]];
        SettingArrowItem *about = [SettingArrowItem settingItemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[TestViewController class]];
        
        SettingGroup *group1 = [[SettingGroup alloc] init];
        
        group1.header = @"帮助";
        group1.footer = @"";
        
        group1.items = @[newVersion, help, share, message, netease, about];
        
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
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.取出模型
    SettingGroup *group = self.dataList[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    if ([item isKindOfClass:[SettingArrowItem class]]) { // 需要跳转控制器
        SettingArrowItem *arrowItem = (SettingArrowItem *)item; // 强转一下类型
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            
            [self.navigationController pushViewController:vc animated:YES];

        }
    }
    
    // 执行操作block
    if (item.option) {
        item.option();
        return;
    }
    
}
@end
