//
//  ViewController.m
//  汽车品牌字典转模型
//
//  Created by tom-pc on 15/10/19.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
#import "Car.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *carGroupsList;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return  _tableView;
}

- (NSArray *)carGroupsList
{
    if (_carGroupsList == nil) {
        _carGroupsList = [CarGroup carGroups];
    }
    return  _carGroupsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 调用tableView添加到视图
    [self tableView];
   
    NSLog(@"%@", self.carGroupsList);
}

#pragma mark - 数据源方法
// 分组总数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroupsList.count;
}
// 每一组的总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarGroup *group = self.carGroupsList[section];
    return group.cars.count;
}
// 单元格明细
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 设置cell内容
    // 1> 取出数据模型
    CarGroup *group = self.carGroupsList[indexPath.section];
    Car *car = group.cars[indexPath.row];
    
    // 2> 设置数据
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

// 标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarGroup *group = self.carGroupsList[section];
    return  group.title;
}

// 右侧索引列表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // 索引数组中的“内容”，跟分组无关
    // 索引数组中的下标，对应的是分组的下标
    
    // 返回self.carGroup中title的数组
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (CarGroup *group in self.carGroupsList) {
//        [arrayM addObject:group.title];
//    }
//    return arrayM;
    
    // KVC间接获取或者修改对象属性的方式
    // 使用KVC再获取数值时，如果指定对象不包含keyPath的“键名”，会自动进入对象的内部查找
    // 如果取值的对象是一个数组，同样返回一个数组
    
    NSArray *array = [self.carGroupsList valueForKeyPath:@"cars.name"];
    NSLog(@"%@", array);
    
    return  [self.carGroupsList valueForKeyPath:@"title"];
    
}
@end
