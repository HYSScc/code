//
//  TwoViewController.m
//  05-导航控制器简单使用
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()
- (IBAction)next:(id)sender;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 导航栏设置内容
    // 设置标题
    self.navigationItem.title = @"设置";
    // 设置返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 设置导航栏左边按钮
    // 如果设置了leftBarButtonItem,之前那个返回无效
    UIBarButtonItem *leftBtnTwo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self  action:@selector(backToOne)];
    self.navigationItem.leftBarButtonItem = leftBtnTwo;
    // 设置导航栏右边按钮
    UIBarButtonItem *rightBtnTwo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
    UIBarButtonItem *rightBtnTw = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = rightBtnTwo;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightBtnTw, rightBtnTwo, nil];
}
// leftBtnTwo按钮监听
- (void)backToOne
{   // 将栈顶的控制器给移除
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)next:(id)sender {
    ThreeViewController *three = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:three animated:YES];
}


@end
