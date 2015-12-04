//
//  TabBar.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/11/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

// 1.block作用：保存一段代码，到需要的时候才去定义
typedef void(^TabBarBlock)(NSInteger selectedIndex); // 需要传参数给控制器

// 2.定义代理协议
@protocol TabBarDelegate <NSObject>

@optional // 可选实现
- (void)tabBar:(TabBar *)tabBar didSelectedIndex:(NSInteger)index;    // 第一步 作为谁的代理  第二步 告诉方法的作用 告诉它选中了哪个角标

@end

@interface TabBar : UIView

// 1.将block声明为自己的属性
@property (nonatomic, copy) TabBarBlock block; // block一般用copy定义

// 2.将代理声明为自己的属性
@property (nonatomic, weak) id<TabBarDelegate> delegate; // 代理用weak

// 3.给外界创建按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selImageName;

@end
