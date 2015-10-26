//
//  ViewController.m
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Tg.h"
#import "tgCell.h"
#import "footerView.h"

@interface ViewController () <footerViewDelegate>
@property (nonatomic, strong) NSMutableArray *tgList;
@end

@implementation ViewController

- (NSArray *)tgList
{
    if (_tgList == nil) {
        _tgList = [Tg tgs];
    }
    return _tgList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 100; // 设置行高
    
    // 调整边距，可以让表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0); // 设置顶端的空隙
    
    // footerView
    // footerView的宽度会和表格整体宽度一致，只需要指定高度即可
//    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    // 从XIB加载最后一个视图设置为footerView
//    footerView *footer = [[[NSBundle mainBundle] loadNibNamed:@"footerView" owner:nil options:nil] lastObject];
    
    footerView *footer = [footerView footView];
    // 视图控制器成为footerView的代理
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
//    self.tableView.tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"footerView" owner:nil options:nil] lastObject];
    
    // 设置header
    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"tgHeadView" owner:nil options:nil] lastObject];
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    tgCell *cell = [tgCell cellWithTableView:tableView];
    
    // 4. 通过数据模型，设置cell内容,可以让视图控制器不需要了解cell内部的实现细节
    cell.tg = self.tgList[indexPath.row];
    
    return cell;
}

#pragma mark - footerView的代理方法
- (void)footerViewDidDownloadButtonClick:(footerView *)footerView
{
    // 加载数据
    NSLog(@"努力加载数据中···");
    
    // 向数组中添加数据，模拟网络加载完成之后的效果
    NSDictionary *dict = @{@"title" : @"薯片", @"icon" : @"ad_00", @"price": @"100.2", @"buyCount": @"2"};
    Tg *tg = [Tg tgWithDict:dict];
    
    [self.tgList addObject:tg];
    
    // 刷新数据
//    [self.tableView reloadData];
    // 新建一个indexPath
    NSIndexPath *path = [NSIndexPath indexPathForRow:(self.tgList.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
}
@end
