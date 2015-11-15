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
    // 1.文本框代理
    _accountField.delegate = self;
    // 2.通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:_accountField];
    // 3.addTarget
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断：因为输入麻烦直接在storyboard中提前打好用户名密码，可是登录按钮不能点击，所以调用这个方法。
    [self textChange];
}

- (void)textChange
{
    // 优化判断两个文本框的内容
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@", _accountField.text);
}
// 移除控制中心
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
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
// 用户点击登录的时候，就会调用
- (IBAction)loginBtn:(id)sender {
    // 判断用户输入的账号密码是否正确
    if ([_accountField.text isEqualToString:@"xxm"] && [_pwdField.text isEqualToString:@"123"]) {// 账号密码正确
        // 跳转到联系人界面
//        UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UIViewController *vc = [s instantiateViewControllerWithIdentifier:@"tableViewController"];
//        NSLog(@"%@", [vc class]);
//        [self.navigationController pushViewController:vc animated:YES];
        
        // 第三方框架 显示遮盖
        [MBProgressHUD showMessage:@"吃奶登录中"];
        
        // GCD延迟操作
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 移除遮盖
            [MBProgressHUD hideHUD];
            
            [self performSegueWithIdentifier:@"login" sender:nil];
            
        });
        
    
    }else{ // 不正确
        // MBProgressHub:提示框 第三方类 拖入文件 导入头文件
        [MBProgressHUD showError:@"账号密码错误"];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"账号密码错误" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//        [alert show];
    }
}
@end
