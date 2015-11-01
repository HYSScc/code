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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *messageFrameModelList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *inputView;
// 自动回复数组
@property (strong, nonatomic) NSDictionary *autoReplay;
@end

@implementation ViewController

- (NSMutableArray *)messageFrameModelList
{
    if (_messageFrameModelList == nil) {
        _messageFrameModelList = [MessageFrameModel messageFrameModel];
    }
    return _messageFrameModelList;
}

// 自动回复数组的懒加载
- (NSDictionary *)autoReplay
{
    if (_autoReplay == nil) {
        _autoReplay = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReplay.plist" ofType:nil]];
    }
    return _autoReplay;
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
    
    // 取出字典中的值（最终键盘的frame）
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]; // CGRectValue将类型转为CGRect类型
    // 键盘实时y
    CGFloat keyY = frame.origin.y;
    
    // 屏幕高度
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    // 动画时间
    CGFloat keyDuration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 执行动画
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

#pragma mark - textField代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 打印出输入的文字
    NSLog(@"%@", textField.text);
    
    // 1.发送一条数据
    [self addmessage:textField.text type:MessageModelG];
    
    // 3.自动回复
    NSString *s = [self autoReplayWithText:textField.text];
    //   将自动回复添加成一条聊天记录
    [self addmessage:s type:MessageModelJ];

    // 4.清空表格中文字
    self.inputView.text = nil;
    // 直接returnYES即可
    return YES;
}

// 生成一个自动回复信息
- (NSString *)autoReplayWithText:(NSString *)text
{
    NSString *str;
    
    for (int i = 0; i < text.length; i++) {
        NSString *subStr = [text substringWithRange:NSMakeRange(i, 1)]; // 截取数据
        
        if (self.autoReplay[subStr]) {
            str = self.autoReplay[subStr];
        }else
        {
            str = @"滚犊子";
        }
    }
    return str;
}

// 添加一条聊天信息
- (void)addmessage:(NSString *)text type:(MessageModelType)type
{
    // 1.添加模型数据
    MessageModel *messageM = [[MessageModel alloc] init];
    //   设置数据的值
    messageM.time = @"16:23";
    messageM.text = text;
    messageM.type = type;
    
    // 设置内容的frame
    MessageFrameModel *messageFrameModel = [[MessageFrameModel alloc] init];
    messageFrameModel.messageModel = messageM;
    [self.messageFrameModelList addObject:messageFrameModel];
    
    // 2.刷新表格
    [self.tableView reloadData];
    
    // 3.自动上移tableView
    //   移动的位置
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrameModelList.count - 1 inSection:0];
    //   真正去的位置atScrollPosition:滚到位置
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    }

@end
