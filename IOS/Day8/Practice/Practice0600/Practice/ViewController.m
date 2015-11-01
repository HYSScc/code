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
#import "MessageFrameModel.h"

// 遵守UITableView的两个协议
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

// 声明可变数组属性，为了接收模型中的数组类方法
@property (nonatomic, strong) NSMutableArray *messageFrameModelList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *inputView;
// 自动回复字典的声明
@property (strong, nonatomic) NSDictionary *dict;
@end

@implementation ViewController

// 懒加载，实例化可变数组，接收模型数组的类方法
- (NSMutableArray *)messageFrameModelList
{
    if (_messageFrameModelList== nil) {
        _messageFrameModelList = [MessageFrameModel messageFrameModel];
    }
    return _messageFrameModelList;
}

- (NSDictionary *)dict
{
    if (_dict == nil) {
        _dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReplay.plist" ofType:nil]];
    }
    return _dict;
}

// 取消状态栏的显示
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消cell的选中效果
    self.tableView.allowsSelection = NO;
    
    // 设置tableView背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:200/225.0 green:200/225.0 blue:200/225.0 alpha:1.0];
    
    // 分隔线的去除
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    
    // 设置通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 添加监听方法
    [center addObserver:self selector:@selector(KeyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

#pragma mark - 键盘
// 监听方法
- (void)KeyboardDidChangeFrame:(NSNotification *)noti
{
    NSLog(@"-----%@", noti.userInfo);
    
    // 添加动画，实现屏幕平移
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyY = frame.origin.y;
    CGFloat keyDuration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    [UIView animateWithDuration:keyDuration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyY - screenHeight);
    }];
    
    // 改变window颜色
    self.view.window.backgroundColor = self.tableView.backgroundColor;
}

// 键盘隐藏
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 返回数组的元素个数
    return self.messageFrameModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 类方法实例化cell
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    // 给cell设置内容位置，在相应的行
    cell.messageFrameModel = self.messageFrameModelList[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 给cell相应地行实例化模型
    MessageFrameModel *m = self.messageFrameModelList[indexPath.row];
    return  m.cellHeight;
}

#pragma mark - textField代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 打印输入的文字
    NSLog(@"%@", textField.text);
    
    // 1.传人一条聊天记录
    [self addmessage:textField.text type:MessageModelG];
    
   
    // 3.自动回复
    NSString *s = [self autoReplayWithText:textField.text];
    [self addmessage:s type:MessageModelJ];
    
    // 4.清空表格文字
    self.inputView.text = nil;
    
    return YES;
}

// 抽取出生成一条聊天记录的方法
- (void)addmessage:(NSString *)text type:(MessageType)type
{
    // 1.添加数据模型
    MessageModel *mm = [[MessageModel alloc] init];
    //   设置数据的值
    mm.time = @"16.43";
    mm.text = text;
    mm.type = type;
    
    // 设置内容的frame
    MessageFrameModel *mfm = [[MessageFrameModel alloc] init];
    mfm.messageModel = mm;
    [self.messageFrameModelList addObject:mfm];
    
    // 2.刷新表格
    [self.tableView reloadData];
    
    // 3.自动上移tableView
    //   移动的位置
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrameModelList.count - 1 inSection:0];
    //   真正移动到的位置
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

// 抽取出自动回复方法
- (NSString *)autoReplayWithText:(NSString *)text
{
     NSString *str;
    
    for (int i = 0 ; i < text.length; i++) {
        NSString *subStr = [text substringWithRange:NSMakeRange(i, 1)]; // 截取数据
        
        if (self.dict[subStr]) {
            str = self.dict[subStr];
        } else
        {
            str = @"滚犊子";
        }
    }
    return str;
}
@end
