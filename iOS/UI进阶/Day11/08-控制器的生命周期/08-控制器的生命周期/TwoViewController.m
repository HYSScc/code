//
//  TwoViewController.m
//  08-控制器的生命周期
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"Two view加载完毕");
    NSLog(@"%s view加载完毕", __func__);
}
// view即将显示
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s view即将显示", __func__);
}
// view完成显示
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%s view完成显示", __func__);
}
// view即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s view即将消失", __func__);
}
// view消失
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%s view消失", __func__);
}
// view将被卸载
- (void)viewWillUnload
{
    NSLog(@"%s view将要卸载", __FUNCTION__);
}
// view完成卸载
- (void)viewDidUnload
{
    NSLog(@"%s view完成卸载", __FUNCTION__);
}

@end
