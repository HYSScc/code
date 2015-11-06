//
//  ViewController.m
//  05-表格修改
//
//  Created by tom-pc on 15/10/20.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
/**  数据列表 */
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return  _tableView;
}

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithObjects:@"zhangsan", @"lisi", @"eangwu", nil];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    // 开始编辑，一旦editing = YES就默认开启删除模式
    self.tableView.editing = YES;
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
}

// 只要实现此方法，就能够支持手势拖拽删除，删除需要自己做。
/**
 UITableViewCellEditingStyleNone
 UITableViewCellEditingStyleDelete // 删除
 UITableViewCellEditingStyleInsert // 添加
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // MVC -> 数据是保存在模型中
        // 1.删除self.dataList中indexPath对应的数据
        [self.dataList removeObjectAtIndex:indexPath.row];
        
        // 2.刷新表格(重新加载数据)
        //    [self.tableView reloadData]; // 重新加载所有数据
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle]; // 让表格控件动画删除指定的行
    } else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        
        // 1.向数组添加数据
        [self.dataList insertObject:@"" atIndex:indexPath.row + 1];
        // 2.刷新表格
        // 新建一个indexPath
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        // 让表格控件动画在指定indexPath添加指定行
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
}

// 移动表格行(只要实现此方法就能实现拖动表格行)
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 界面数据UITableView已经完成
    // 调整数据即可
//    [self.dataList exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    // 1.将源从数组中取出
    id souce = self.dataList[sourceIndexPath.row];
    // 2.将源从数组中删除
    [self.dataList removeObjectAtIndex:sourceIndexPath.row];
    // 3.将源插入到数组中的目标位置
    [self.dataList insertObject:souce atIndex:destinationIndexPath.row];
    
    NSLog(@"%@", self.dataList);
}


#pragma mark - 代理方法
// 返回编辑样式,如果没事实现此方法，默认都是删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}



@end
