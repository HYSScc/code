//
//  NavigationController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "NavigationController.h"

#define iOSVersion [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 第一次使用这个类或者这个类的子类的时候调用
+ (void)initialize
{
#warning 1.获取应用程序中所有的导航条
    
    if (self == [NavigationController class]) { // 肯定能保证只调用一次
        UINavigationBar *bar = [UINavigationBar appearance];
        
        // 判断系统版本是否大于iOS7.0 后进行设置导航条的背景图片
        if (iOSVersion) { // 获取设备系统version 返回是字符串 转换成浮点
            NSLog(@"9.0");
            [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        }else{
            [bar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
        }
        
        // 设置导航条中心字体颜色
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName : [UIColor whiteColor],
                               NSFontAttributeName : [UIFont systemFontOfSize:15.0]
                               };
        [bar setTitleTextAttributes:dict];
#warning 2.设置导航条上的主题颜色
        // 设置导航条上的主题颜色
        [bar setTintColor:[UIColor whiteColor]];
#warning 3.设置BarButtonItem的背景图片
        // 获取所有UIBarButtonItem的外观
        UIBarButtonItem *buttonItem = [UIBarButtonItem appearance]; // 遵守appearance协议
        // 设置UIBarButton的背景图片
        [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        // 设置返回按钮的背景图片
        [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    
}

// 拦截push方法 一开始自定义Navigation的原因
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES; // 相当于storyboard中 勾选自动隐藏TabBar
    
    return [super pushViewController:viewController animated:animated];
}

@end
