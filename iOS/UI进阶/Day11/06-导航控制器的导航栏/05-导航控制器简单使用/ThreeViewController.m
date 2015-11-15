//
//  ThreeViewController.m
//  05-导航控制器简单使用
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ThreeViewController.h"
#import "OneViewController.h"

@interface ThreeViewController ()
- (IBAction)backToFirst:(id)sender;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    // 设置标题
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.titleView = btn; // titleView被设置成button
    // 设置返回按钮
    UIButton *red = [UIButton buttonWithType:UIButtonTypeCustom];
    red.bounds = CGRectMake(0, 0, 46, 31); // 自定义btn要设置bounds
    [red addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [red setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    UIBarButtonItem *redBackBtnThree = [[UIBarButtonItem alloc] initWithCustomView:red];
    
    self.navigationItem.leftBarButtonItem = redBackBtnThree;
}

- (void)backClick
{   // 将栈顶的控制器给移除
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backToFirst:(id)sender {
//    OneViewController *one = [[OneViewController alloc] init];
    UIViewController *one = self.navigationController.viewControllers[0];
    [self.navigationController popToViewController:one animated:YES];
}
@end
