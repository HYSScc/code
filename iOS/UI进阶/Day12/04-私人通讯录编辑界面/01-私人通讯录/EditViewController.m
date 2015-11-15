//
//  EditViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "EditViewController.h"
#import "Contact.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation EditViewController

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 给控件赋值
    _nameField.text = self.contact.name;
    _phoneField.text = self.contact.phone;
    
#warning 第一步监听两个文本框的内容，控制器登录按钮的状态
    // 1.addTarget
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断：因为输入麻烦直接在storyboard中提前打好用户名密码，可是登录按钮不能点击，所以调用这个方法。
    [self textChange];
}

- (void)textChange
{
    // 优化判断两个文本框的内容
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
    NSLog(@"%@", _nameField.text);
}

// 监听编辑按钮,点击了编辑按钮就会调用
- (IBAction)edit:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"取消"]) { // 点击取消
        // 1.改变按钮的文字
        sender.title = @"编辑";
        // 2.不允许文本框编辑
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        // 3.隐藏保存按钮
        _saveBtn.hidden = YES;
        // 4.隐藏键盘
//        [_phoneField becomeFirstResponder];
        [self.view endEditing:YES];
        // 5.恢复文本框原来内容显示
        _nameField.text = self.contact.name;
        _phoneField.text = self.contact.phone;
        
    }else{
        // 1.改变按钮的文字
        sender.title = @"取消";
        // 2.允许文本框编辑
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        // 3.显示保存按钮
        _saveBtn.hidden = NO;
        // 4.弹出电话的键盘
        [_phoneField becomeFirstResponder];
        
    }
    
}
// 点击了保存按钮
- (IBAction)save:(id)sender {
    
    // 1.回到联系人界面
    [self.navigationController popViewControllerAnimated:YES];
    // 2.更新数据：覆盖旧数据，把新数据展示出来
    self.contact.name = _nameField.text;
    self.contact.phone = _phoneField.text;
    // 3.通知联系人控制器，刷新表格
    if ([_delegate respondsToSelector:@selector(editViewController:didUpdateModelContact:)]) {
        [_delegate editViewController:self didUpdateModelContact:self.contact];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
