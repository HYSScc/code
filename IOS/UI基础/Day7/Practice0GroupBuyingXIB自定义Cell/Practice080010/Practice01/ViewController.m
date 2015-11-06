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
#import "FooterView.h"

@interface ViewController () <FooterViewDelegate>
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
    
    // 添加footerView
    // 1.
//    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    // 2.
//    FooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
//    footerView.delegate = self;
//    self.tableView.tableFooterView = footerView;
    // 3.
    FooterView *footerView = [FooterView footerView];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
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

#pragma mark - FooterViewDelegate
// 点击按钮后，就会执行的加载
- (void)footerViewDidLoadButtonClick:(FooterView *)footerView
{
    // 加载数据
    NSLog(@"----");
    
    // 延时的块代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(8.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                   
    // 向数组中添加数据，模拟网络加载完成之后的效果
    NSDictionary *dict = @{@"title" : @"薯片", @"icon" : @"ad_00", @"price" : @"100.2", @"buyCount" : @"2"};
    GroupBuyingModel *model = [GroupBuyingModel groupBuyingModelWithDict:dict];
    
    [self.groupBuyingModelList addObject:model];
    
    // 刷新数据(刷新所有表格)
//    [self.tableView reloadData];
    // 刷新最后一行数据
    NSIndexPath *path = [NSIndexPath indexPathForRow:(self.groupBuyingModelList.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
    
    // 移动位置
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    [footerView endRefresh];
                       
    });
}

@end
