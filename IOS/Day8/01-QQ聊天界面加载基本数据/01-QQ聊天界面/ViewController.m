//
//  ViewController.m
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/27.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *messageModelList;
@end

@implementation ViewController

- (NSMutableArray *)messageModelList
{
    if (_messageModelList == nil) {
        _messageModelList = [MessageModel messageModel];
    }
    return _messageModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    return cell;
}

#pragma mark - 代理方法

@end
