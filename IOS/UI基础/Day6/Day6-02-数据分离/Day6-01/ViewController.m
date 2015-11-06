//
//  ViewController.m
//  Day6-01
//
//  Created by tom-pc on 15/10/16.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据列表 */
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation ViewController

- (NSArray *)dataList
{
    if (_dataList == nil) {
        
        Student *stu1 = [[Student alloc] init];
        stu1.title = @"论室友，日了狗";
        stu1.desc = @"坑爹";
        
        // 可变数组
        // 生成编号数组
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 0; i < 2; i++) {
            [arrayM addObject:[NSString stringWithFormat:@"%@ - %d", stu1.title, i]];
        }
        stu1.students = arrayM;
        
        _dataList = @[stu1];
    }
    return  _dataList;
}

#pragma mark - 数据源方法
// 如果没有实现，默认是1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

// 每个分组中的数据总数
// section:分组的编号
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // students数组中的元素数量
    // 取出数组中对应的学员信息
//    Student *stu = self.dataList[section];
//    return stu.students.count;
    return [[self.dataList[section] students ] count];
    
}

// 告诉表格控件，每一行cell单元格的细节
// indexPath
// @property(nonatomic, readonly) NSInteger section;  分组
// @property(nonatomic, readonly) NSInteger row;      行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 实例化TableViewCell时，使用initWithStyle方法来进行实例化
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 取出indexPath对应的数据
    Student *stu = self.dataList[indexPath.section];
    
    cell.textLabel.text = stu.students[indexPath.row];
    
    return cell;
}

// 返回分组的标题文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    Student *stu = self.dataList[section];
//    return stu.title;
    return [self.dataList[section] title];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
//    Student *stu = self.dataList[section];
//    return stu.desc;
    // 直接从数组中取出的对象是id类型，因为没有明确的类型，因此不能使用点语法，只能使用getter方法
    return [self.dataList[section] desc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
