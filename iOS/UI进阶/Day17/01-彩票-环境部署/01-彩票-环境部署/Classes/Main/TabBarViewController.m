//
//  TabBarViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/11/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "TabBarViewController.h"

#import "TabBar.h"

#define iOSVersion [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

@interface TabBarViewController ()<TabBarDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.移除自带的TabBar
//    [self.tabBar removeFromSuperview];
    
    NSLog(@"%@", self.tabBar); // 打印结果：这里还是有值的，所以下面设置frame是可以的；
    
    // 2.创建TabBar
    TabBar *tabBar = [[TabBar alloc] init];// 添加按钮(前面创建TabBar调用init，所以我们创建TabBar上的按钮的时候内部调用init方法) // 将添加按钮的封装在TabBar.m文件中
    
    tabBar.frame = self.tabBar.bounds; // 与系统自带的TabBar相同； // 更改添加到的对象不同后 这里改bounds 从0，0开始
    
    // 添加 定义block 
//    tabBar.block = ^(NSInteger selectedIndex){
//        self.selectedIndex = selectedIndex;
//    }; // 这里TabBarController中自带selectedIndex 属性可以设置不同值 来控制不同的控制器；
    // 添加 定义代理
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar]; // 将自定义TabBar添加到 系统自带的TabBar上 原来是添加到View上
#warning 通过控制器来添加TabBar按钮个数
    // 设置图片时拼接图片名称
    NSString *imageName = nil;
    NSString *selImageName = nil;
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        
        imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        // 添加底部按钮
        [tabBar addTabBarButtonWithName:imageName selName:selImageName];
    }
#warning 获取应用程序中所有的导航条
    UINavigationBar *bar = [UINavigationBar appearance];
    
    // 判断系统版本是否大于iOS7.0 后进行设置导航条的背景图片
    if (iOSVersion) { // 获取设备系统version 返回是字符串 转换成浮点
        NSLog(@"9.0");
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    }else{
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
}
#warning 代理方法 通知点击时切换控制器
// 代理方法
- (void)tabBar:(TabBar *)tabBar didSelectedIndex:(NSInteger)index
{
    // 切换控制器
    self.selectedIndex = index;
}

@end
