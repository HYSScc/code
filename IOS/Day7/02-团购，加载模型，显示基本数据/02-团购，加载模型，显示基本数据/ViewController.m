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
@interface ViewController ()
@property (nonatomic, strong) NSArray *tgList;
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
}

///** 隐藏状态栏 */
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 可重用标示符
    NSString *ID = @"Cell";
    // 2. tableView查询可重用Cell
    tgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3. 如果没有可重用Cell
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        // 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"tgCell" owner:nil options:nil] lastObject];
    }
    // 4. 设置cell内容
    //    1> 取出模型
    Tg *tg = self.tgList[indexPath.row];
    
//    cell.textLabel.text = tg.title;
//    cell.imageView.image = [UIImage imageNamed:tg.icon];
//    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@          已有%@人购买", tg.price, tg.buyCount];
    cell.titleLabel.text = tg.title;
    cell.iconView.image = [UIImage imageNamed:tg.icon];
    cell.priceLabel.text = tg.price;
    cell.buyCountLabel.text = tg.buyCount;
    
    return cell;
}
@end
