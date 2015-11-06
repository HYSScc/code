//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "GroupBuyingModel.h"
#import "GroupBuyingCell.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *groupBuyingModelList;
@end

@implementation ViewController

// 懒加载模型
- (NSMutableArray *)groupBuyingModelList
{
    if (_groupBuyingModelList == nil) {
        _groupBuyingModelList = [GroupBuyingModel groupBuyingModel];
    }
    return _groupBuyingModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在UItableViewController中，self.view就是self.tableView
    NSLog(@"%p, %p", self.view, self.tableView);
    
    self.tableView.rowHeight = 100;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuyingModelList.count;
}

#pragma mark - 代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    GroupBuyingCell *cell = [GroupBuyingCell cellWithTableView:tableView];
    
    // 2.实例化模型
    GroupBuyingModel *gbm = self.groupBuyingModelList[indexPath.row];
    
    // 3.通过cell中的模型的setter方法，将内容设置
    cell.groupBuyingModel = gbm;
    
    return cell;
}
@end
