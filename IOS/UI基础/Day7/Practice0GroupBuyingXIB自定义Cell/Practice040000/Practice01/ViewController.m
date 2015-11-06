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
    static NSString *ID = @"Cell";
    GroupBuyingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        // 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupBuyingCell" owner:nil options:nil] lastObject];
    }
    
    GroupBuyingModel *gbm = self.groupBuyingModelList[indexPath.row];
    
    cell.groupBuyingModel = gbm;
    
    return cell;
}
@end
