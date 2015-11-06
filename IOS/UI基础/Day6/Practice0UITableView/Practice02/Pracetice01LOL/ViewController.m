//
//  ViewController.m
//  Pracetice01LOL
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *studentsList;
@end

@implementation ViewController

- (NSArray *)studentsList
{
    if (_studentsList == nil) {
        
        Student *stu1 = [[Student alloc] init];
        stu1.title = @"论室友";
        stu1.desc = @"日了狗";
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 0; i<2; i++) {
            [arrayM addObject:[NSString stringWithFormat:@" %d", i]];
        }
        stu1.students = arrayM;
        
        _studentsList = @[stu1]; //将这个学生封转成数组的一个元素
        
    }
    return _studentsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.studentsList.count; // 数组中只有一个元素，值返回一个列表
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    Student *stu = self.studentsList[section];
//    return stu.students.count;
    
    return [[self.studentsList[section] students] count]; // 返回studentsList的一个元素（这个元素是数组）再返回这个元素中的个数，作为一个列表中的行数
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"----- %04ld", indexPath.row];
    Student *stu = self.studentsList[indexPath.section];
    
    cell.textLabel.text = stu.students[indexPath.row];
    
    return cell;
}

// 分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    return [NSString stringWithFormat:@"属性%ld", section];
//    return [[self.studentsList[section] title]; // title值不对
    Student *stu = self.studentsList[section];
    return stu.title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
//    return [NSString stringWithFormat:@"----%ld", section];
    return [self.studentsList[section] desc];
}

@end
