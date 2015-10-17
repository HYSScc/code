//
//  ViewController.m
//  Day6-01
//
//  Created by tom-pc on 15/10/16.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 数据源方法
// 如果没有实现，默认是1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// 每个分组中的数据总数
// section:分组的编号
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else
    {
        return 4;
    }
}

// 告诉表格控件，每一行cell单元格的细节
// index
// @property(nonatomic, readonly) NSInteger section;  分组
// @property(nonatomic, readonly) NSInteger row;      行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 实例化TableViewCell时，使用initWithStyle方法来进行实例化
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"论室友,日了狗 - %04ld", indexPath.row];
    
    return cell;
}

// 返回分组的标题文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"属性 %ld", section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"太坑爹了";
    } else
    {
        return @"极度坑爹";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
