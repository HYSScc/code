//
//  ViewController.m
//  Practice03
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *heroModelList;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
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
    }
    
    Hero *model = self.heroModelList[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
    
}

@end
