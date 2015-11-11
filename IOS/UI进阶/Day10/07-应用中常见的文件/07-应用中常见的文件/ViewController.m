//
//  ViewController.m
//  07-应用中常见的文件
//
//  Created by tom-pc on 15/11/11.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)hiden:(id)sender {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
// 状态栏的样式(由控制器决定)
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
- (IBAction)open {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
}

@end
