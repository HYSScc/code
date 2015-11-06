//
//  ViewController.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "MessageCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *messageModelList;
@end

@implementation ViewController

- (NSMutableArray *)messageModelList
{
    if (_messageModelList) {
        _messageModelList = [MessageModel messageModel];
    }
    return _messageModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.messageModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    return cell;
}
@end
