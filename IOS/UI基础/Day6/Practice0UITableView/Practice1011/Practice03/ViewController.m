//
//  ViewController.m
//  Practice03
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *heroModelList;
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
    return _tableView;
}

- (NSArray *)heroModelList
{
    if (_heroModelList == nil) {
        _heroModelList = [Hero heroModel];
    }
    return _heroModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    self.tableView.rowHeight = 100;
    // 分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
//        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; // 默认提供的控件
        
        // 背景颜色
//        cell.backgroundColor = [UIColor redColor];
        
        // 背景视图
//        UIImage *image = [UIImage imageNamed:@"img_01"];
//        cell.backgroundView = [[UIImageView alloc] initWithImage:image];
        
        // 选中的背景视图
//        UIImage *selectImage = [UIImage imageNamed:@"img_02"];
//        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectImage];
        
        // 背景视图颜色
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor redColor];
//        cell.backgroundView = view;
        
    }
    
    Hero *model = self.heroModelList[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.intro;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    
    // 自定义按钮
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd]; // 后添加的自定义button
    
    // 自定义控件 添加监听方法（switch)
    UISwitch *switcher = [[UISwitch alloc] init];
    // 添加监听方法
    [switcher addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = switcher;
    
    return cell;
    
}

// 自定义控件的监听方法
- (void)switchChanged:(UISwitch *)sender
{
    NSLog(@"%s %@", __func__, sender);
}

#pragma mark - 代理方法
// 行高
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return (indexPath.row % 2) ? 60 : 44;
//}

// 监听方法，选中右箭头的某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}

// 监听方法，取消选中某一行时，监听动作，极少用，容易出错
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}

// 监听方法，监听按钮的动作；此方法不会触发行选中，跟行的选中各自独立。只是为accessoryType服务，对自定义控件不响应
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}

@end
