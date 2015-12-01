//
//  NavigationController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 拦截push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES; // 相当于storyboard中 勾选自动隐藏TabBar
    
    return [super pushViewController:viewController animated:animated];
}

@end
