//
//  OneViewController.m
//  05-导航控制器简单使用
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()
- (IBAction)next:(id)sender;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏的内容
    // 设置标题
    self.navigationItem.title = @"通用";
    // 设置导航栏左边的按钮
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    // 设置下一个控制器的返回按钮
    // 当前控制器的navigationItem里的返回按钮是决定下一个控制器的返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (IBAction)next:(id)sender {
    TwoViewController *two = [[TwoViewController alloc] init];
    
    [self.navigationController pushViewController:two animated:YES];
}
@end
