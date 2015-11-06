//
//  ViewController.m
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "MicroblogStatusModel.h"
#import "MicroblogCell.h"
#import "MicroblogFrameModel.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *microblogFrameModelList;

@end

@implementation ViewController

- (NSArray *)microblogFrameModelList
{
    if (_microblogFrameModelList == nil) {
        _microblogFrameModelList = [MicroblogFrameModel microblogFrameModel];
    }
    return _microblogFrameModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.rowHeight = 200;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.microblogFrameModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    MicroblogCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MicroblogCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    MicroblogFrameModel *model = self.microblogFrameModelList[indexPath.row];
    
    cell.microblogFrameModel = model;
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MicroblogFrameModel *fModel = self.microblogFrameModelList[indexPath.row];
    return fModel.cellHeight;
}
@end
