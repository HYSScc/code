//
//  ViewController.m
//  Practice03
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *heroModelList;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
    
}



@end
