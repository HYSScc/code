//
//  ViewController.m
//  06-应用程序管理 cell的重用
//
//  Created by tom-pc on 15/11/9.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "CZAppsModel.h"
#import "appsCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

- (NSArray *)apps
{
    if (_apps == nil) {
        
        NSArray *appArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        
        NSMutableArray *appsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in appArr) {
            CZAppsModel *model = [CZAppsModel appsWithDict:dict];
            
            [appsArray addObject:model];
        }
        
        _apps = appsArray;
        
    }
    
    return _apps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // storyboard默认会做的操作
//    if (cell == nil) {
//        <#statements#>
//    }
    appsCell *cell = [appsCell appsCellWithTableView:tableView];
    CZAppsModel *model = self.apps[indexPath.row];
    cell.model = model;
    
    return cell;
}

@end
