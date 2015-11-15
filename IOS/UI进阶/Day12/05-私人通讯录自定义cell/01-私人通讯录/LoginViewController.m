//
//  LoginViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *autoLoginS; // 记住密码Switch
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdS; // 自动登录Switch
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning 第一步监听两个文本框的内容，控制器登录按钮的状态
    // 1.addTarget
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断：因为输入麻烦直接在storyboard中提前打好用户名密码，可是登录按钮不能点击，所以调用这个方法。
    [self textChange];
}
// 当文本框的内容改变的时候就会调用
- (void)textChange
{
    // 优化判断两个文本框的内容
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@", _accountField.text);
}
#warning 第二步 处理Switch
// 当记住密码状态改变的时候调用
- (IBAction)rmbPwdSwitch:(UISwitch *)sender {
    //当记住密码开始关闭时，isOn可以看成一个动作。如果autoLogin是开启的话，那么autoLogin也关闭
    if (sender.isOn == NO) {
        // 动画
        [_autoLoginS setOn:NO animated:YES];
//        _autoLoginS.on = NO;
    }
}
// 当自动登录状态改变的时候调用
- (IBAction)autoLoginSwitch:(UISwitch *)sender {
    
    if (sender.isOn == YES) {
        [_rmbPwdS setOn:YES animated:YES];
    }
}
#warning 处理登录的功能
// 用户点击登录的时候，就会调用
- (IBAction)loginBtn:(id)sender {
    // 判断用户输入的账号密码是否正确
    if ([_accountField.text isEqualToString:@"xxm"] && [_pwdField.text isEqualToString:@"123"]) {// 账号密码正确
        
        // 第三方框架 显示遮盖
        [MBProgressHUD showMessage:@"吃奶登录中"];
        
        // GCD延迟操作
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 移除遮盖
            [MBProgressHUD hideHUD];
            // 跳转到联系人界面
            [self performSegueWithIdentifier:@"login" sender:nil];
            
        });
        
    
    }else{ // 不正确
        // MBProgressHub:提示框 第三方类 拖入文件 导入头文件
        [MBProgressHUD showError:@"账号密码错误"];
    }
}
#warning 第四步做跳转之前的准备工作
// 做跳转
/**
 执行segue的时候，跳转之前调用
 一般用于一些跳转之前的准备，给下一个控制器传值
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@---%@---%@", segue.identifier, segue.destinationViewController, segue.sourceViewController);
    // 获取目的控制器
    UITableViewController *v = segue.destinationViewController;
    // 给联系人导航条设置标题
    v.navigationItem.title = [NSString stringWithFormat:@"%@的联系人", _accountField.text];
}
@end
