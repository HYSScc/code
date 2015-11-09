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

@interface ViewController ()
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
    return model.friends.count;
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
    
    //    return [UIButton buttonWithType:UIButtonTypeContactAdd]; // 检查是否实现headerView
    return header;
}
@end
