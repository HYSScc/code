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
#warning 获取应用程序中所有的导航条
    
    if (self == [NavigationController class]) { // 肯定能保证只调用一次
        UINavigationBar *bar = [UINavigationBar appearance];
        
        // 判断系统版本是否大于iOS7.0 后进行设置导航条的背景图片
        if (iOSVersion) { // 获取设备系统version 返回是字符串 转换成浮点
            NSLog(@"9.0");
            [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        }else{
            [bar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
        }
        
        // 设置导航条字体颜色
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName : [UIColor whiteColor],
                               NSFontAttributeName : [UIFont systemFontOfSize:15.0]
                               };
        [bar setTitleTextAttributes:dict];
    }
    
}

// 拦截push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES; // 相当于storyboard中 勾选自动隐藏TabBar
    
    return [super pushViewController:viewController animated:animated];
}

@end
