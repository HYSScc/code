//
//  ViewController.m
//  08-控制器的生命周期
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// view加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View加载完毕");
}
// view即将显示
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"view即将显示");
}
// view完成显示
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"view完成显示");
}
// view即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"view即将消失");
}
// view消失
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"view消失");
}
// view将被卸载
- (void)viewWillUnload
{
    NSLog(@"%s view将要卸载", __FUNCTION__);
}
// view完成卸载
- (void)viewDidUnload
{
#warning view被卸载的时候，会清空数据
    NSLog(@"%s view完成卸载", __FUNCTION__);
}
// 内存警告
- (void)didReceiveMemoryWarning
{
    NSLog(@"%s", __func__);
    [super didReceiveMemoryWarning];
}
- (void)dealloc
{
    
}
@end
