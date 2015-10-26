//
//  ViewController.m
//  01-UITableViewController
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在UITableViewController中self.view就是self.tableView
    NSLog(@"%p %p", self.view, self.tableView);
    
    NSLog(@"%@", self.view.class); // view就是tableView
}

#pragma mark - 数据源方法
/** 以下两个方法，就是UITableViewController底层的父类方法实现 
    
    可以不实现任何数据源方法，程序也不会崩溃
 */
// 分组的总行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// 返回单元格的明细
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
