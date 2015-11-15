//
//  AddViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "AddViewController.h"
#import "ContactsTableViewController.h"
#import "Contact.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning 第一步监听两个文本框的内容，控制器登录按钮的状态
    // 1.addTarget
    [_nameTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断：因为输入麻烦直接在storyboard中提前打好用户名密码，可是登录按钮不能点击，所以调用这个方法。
    [self textChange];
    
    // 弹出姓名的文本框
//    [_nameTextField becomeFirstResponder];
}

- (void)textChange
{
    // 优化判断两个文本框的内容
    _addBtn.enabled = _nameTextField.text.length && _phoneTextField.text.length;
    NSLog(@"%@", _nameTextField.text);
}
#warning 回到上一个控制器
// 点击添加按钮
- (IBAction)add:(id)sender {
    // 1.点击添加按钮回到上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 创建一个模型
    Contact *contact = [Contact contactWithName:_nameTextField.text phone:_phoneTextField.text];
    // 2.通知代理做事情
    //
    if ([_delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        [_delegate addViewController:self didAddContact:contact];
    }
    
    // 2.把文本框的内容传递给联系人控制器
//    [self.contact setName:_nameTextField.text phone:_phoneTextField.text]; // 先声明联系人列表控制器，然后拿到它，在再联系人列表中添加这个方法。进行调用将内容传递给联系人列表控制器。
}
// 弹出姓名的文本框
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 弹出姓名的文本框
    [_nameTextField becomeFirstResponder];
}
@end
