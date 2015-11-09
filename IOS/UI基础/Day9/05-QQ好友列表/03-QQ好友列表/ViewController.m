//
//  ViewController.m
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroup.h"
#import "FriendModel.h"
#import "HeaderView.h"

@interface ViewController () <HeaderViewDelegate>
@property (nonatomic, strong) NSArray *friendList;
@end

@implementation ViewController
// 懒加载模型数组
- (NSArray *)friendList
{
    if (_friendList == nil) {
        _friendList = [FriendGroup friendGroup];
    }
    return _friendList;
}
// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 当cell、header、footer是固定值的时候，使用以下操作
    // frame是动态的时候，不便调用
//    self.tableView.rowHeight = 44;
//    self.tableView.sectionHeaderHeight = 44;
//    self.tableView.sectionFooterHeight = 44;
    
    // 添加通知监听者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiClick) name:@"friend" object:nil];
}

// 通知方法的实现
- (void)notiClick
{
    [self.tableView reloadData];
}
// 注册通知 一定就要移除 1控制器方法 2dealloc方法
// 这个方法是在控制器销毁的时候调用
- (void)dealloc
{
    // 非ARC必须调取这个方法
//    [super dealloc];
    // 移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 数据源方法
// 列
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendList.count;
}
// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendGroup *model = self.friendList[section];
//    return model.friends.count;
    return model.open ? model.friends.count : 0;
    
}
// 单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 1.取出当前section model
    FriendGroup *group = self.friendList[indexPath.section];
    
    // 2.取出当前section model 中的 row 行
    FriendModel *model = group.friends[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    // 添加设置vip字体颜色
    cell.textLabel.textColor = (model.vip) ? [UIColor redColor] : [UIColor blackColor];
    
    return cell;
}
// header
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    FriendGroup *model = self.friendList[section];
//    return [NSString stringWithFormat:@"%@", model.name];
//}
// headerheight
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    // 动态更改
    return 44;
}
/**
 *  当一个控件没有显示出来的时候
 1> 父控件的frame
 2> 当前控件frame
 3> 当前控件 hidden (是否为YES)
 4> alpha <= 0.01
 */
// headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *header = [HeaderView headerViewWith:tableView];
    
    // 设置内容取出模型,传到View中
    FriendGroup *group = self.friendList[section];
    header.group = group;
    
//    // 让控制器充当headerView的代理
//    header.delegate = self;
    // block
    // ()中是传过来的参数 ^ 是block的象征 {}做相应地操作
//    header.block = ^(HeaderView *view){
//        [tableView reloadData];
//    };
    
    //    return [UIButton buttonWithType:UIButtonTypeContactAdd]; // 检查是否实现headerView
    return header;
}

#pragma mark - headerView
//- (void)headerView:(HeaderView *)view
//{
//    // 刷新表格
//    [self.tableView reloadData];
//}

@end
