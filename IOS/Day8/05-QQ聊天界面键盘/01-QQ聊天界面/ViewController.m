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
#import "MessageFrameModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *messageFrameModelList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (NSMutableArray *)messageFrameModelList
{
    if (_messageFrameModelList == nil) {
        _messageFrameModelList = [MessageFrameModel messageFrameModel];
    }
    return _messageFrameModelList;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // cell 不可选中
    self.tableView.allowsSelection = NO;
    
    // 设置tableView的背景色(先要在cell中，去除cell的颜色)
    self.tableView.backgroundColor = [UIColor colorWithRed:200/225.0 green:200/225.0 blue:200/225.0 alpha:1.0];
    
    // 分隔线的去除
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

// 监听方法
- (void)keyboardDidChangeFrame:(NSNotification *)noti
{
    NSLog(@"------%@", noti.userInfo);
    
    // 改变window的背景颜色
    self.view.window.backgroundColor = self.tableView.backgroundColor;
    
    // 取出字典中的值
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]; // CGRectValue将类型转为CGRect类型
    CGFloat keyY = frame.origin.y;
    
    // 屏幕高度
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat keyDuration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 动画
    [UIView animateWithDuration:keyDuration animations:^{
        // 屏幕的平移
        self.view.transform = CGAffineTransformMakeTranslation(0, keyY - screenHeight);
    }];
}

// 当tableView滚动的时候，结束编辑事件(退出键盘)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrameModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    cell.messageFrameModel = self.messageFrameModelList[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageFrameModel *m = self.messageFrameModelList[indexPath.row];
    return m.cellHeight;
}

@end
