//
//  ViewController.m
//  Day1练习
//
//  Created by tom-pc on 15/9/28.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
/*
 * 要求: QQ文本框要有“请输入QQ”的文字提示(用户输入文字时会自动消失)
 * 密码⽂本框要有“请输⼊密码”的文字提⽰示(用户输⼊文字时会自动消失)
 * QQ⽂本框只能输⼊数字
 * 密码⽂本框的文字必须是暗文显⽰
 * 点击登录按钮后输出⽤用户输入的QQ和密码,并且退出键盘
 
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *n1;

@property (weak, nonatomic) IBOutlet UITextField *n2;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 密码文本框文字是隐藏的(密文的)
    [_n2 setSecureTextEntry:YES];
    
    // 提示信息，自动隐藏
    self.n1.placeholder=@"请输入号码";
    
    self.n2.placeholder=@"请输入密码";
    
}



- (IBAction)register:(UIButton *)sender
{
    NSLog(@"登录");
    // 1.取得界面上“两个文本框”的内容
    NSString *n1 = self.n1.text;
    NSString *n2 = self.n2.text;
    
    NSLog(@"%@ - %@", n1, n2);
    
    
    
    // 参数表示是否强行关闭键盘
    [self.view endEditing:YES];
}


@end
