//
//  ViewController.m
//  05-新浪微博，基本数据加载
//
//  Created by tom-pc on 15/10/25.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "status.h"
#import "StatusCell.h"
#import "StatusFrame.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *statusFrame;
@end

@implementation ViewController

- (NSArray *)statusFrame
{
    if (_statusFrame == nil) {
        _statusFrame = [StatusFrame statusFrames];
    }
    return _statusFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    // 赋值
    cell.statusFrame = self.statusFrame[indexPath.row];
//    cell.status = self.statusesList[indexPath.row];
//    cell.textLabel.text = status.name;
//    cell.imageView.image = [UIImage imageNamed:status.picture];
    
    
    return cell;
}

#pragma mark - 代理方法
// 计算单元格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 计算行高的方法，会在加载表格数据时，有多少行计算多少次 contentSize
    
    // 问题：此方法执行的时候，cell还没有被实例化
    // 但是：行高计算是在实例化cell时，通过设置status属性，计算的-> 有了status模型，就可以知道行高
    
    // 问题： 如何在cell实例化之前，获得行高？
    
    // 解决方法： 通过status可以计算得到行高
//    StatusCell *cell = [[StatusCell alloc] init];
//    cell.statusFrame = self.statusFrame[indexPath.row];
    StatusFrame *statusFrame = self.statusFrame[indexPath.row];
    
    return statusFrame.cellHeight;
}
@end
