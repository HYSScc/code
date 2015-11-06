//
//  ViewController.m
//  Practice13
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
#import "Car.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *carGroupModelList;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (NSArray *)carGroupModelList
{
    if (_carGroupModelList == nil) {
        _carGroupModelList = [CarGroup carGroup];
    }
    return _carGroupModelList;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    NSLog(@"%@", self.carGroupModelList);
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroupModelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarGroup *group = self.carGroupModelList[section];
    
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    CarGroup *group = self.carGroupModelList[indexPath.section];
    Car *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

// 标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarGroup *group = self.carGroupModelList[section];
    return group.title;
}

// 右边索引
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (CarGroup *group in self.carGroupModelList) {
//        [arrayM addObject:group.title];
//    }
//    return arrayM;
//}

// 右侧索引KVC
// UiTableViewDataSource方法
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // 使用KVC在获取值的时候，如果指定对象不包含keyPath的“键名”，会自动进入对象的内部查找。
    // 如果取值的对象是一个数组，同样返回一个数组
    return [self.carGroupModelList valueForKeyPath:@"title"];
}

@end
