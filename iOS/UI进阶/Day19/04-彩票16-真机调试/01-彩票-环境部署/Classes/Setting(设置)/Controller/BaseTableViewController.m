//
//  BaseTableViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "BaseTableViewController.h"

#import "SettingItem.h"

#import "SettingGroup.h"

#import "SettingCell.h"

#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"

#import "TestViewController.h"

#import "MBProgressHUD+MJ.h"

#import "ProductCollectionViewController.h"

#import "PushNoticeController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

// 重写init方法
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped]; // 清除原有数据
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark - Table view data source
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
// cell footer
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SettingGroup *group = self.dataList[section];
    return group.footer;
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
            
            vc.title = item.title;
            
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
