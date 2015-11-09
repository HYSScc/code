//
//  ViewController.m
//  01-静态单元格
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 数据源方法
// 列
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
// 单元格细节
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 判断当前列，并设置内容
    if (indexPath.section == 0) {
        cell.textLabel.text = @"123";
    } else if (indexPath.section == 1){
        cell.textLabel.text = @"456";
    } else if (indexPath.section == 2){
        cell.textLabel.text = @"789";
    }
    
    return cell;
}

@end
