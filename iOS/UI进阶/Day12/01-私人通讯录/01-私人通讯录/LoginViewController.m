//
//  LoginViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.文本框代理
    _accountField.delegate = self;
    // 2.通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:_accountField];
    // 3.addTarget
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)textChange
{
    // 优化判断两个文本框的内容
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@", _accountField.text);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
