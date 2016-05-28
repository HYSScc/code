//
//  TabBar.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/11/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "TabBar.h"

#import "TabBarButton.h"

@interface TabBar()

@property (nonatomic, weak) UIButton *selectButton; // 为了将之前选中的按钮取消声明的成员变量，默认UI控件都是用weak

@end

@implementation TabBar
#warning 第一步在init方法中添加按钮 第五步之后 将无效
// 在initWithFrame方法中创建按钮
// 创建TabBar调用init，内部调用initWithFrame方法。
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加按钮
//        [self addButtons];
        
    }
    return self;
}
#warning 第五步提供方法给控制器添加按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selImageName
{
    TabBarButton *btn = [TabBarButton buttonWithType:UIButtonTypeCustom]; // 创建按钮，用自定义不显示高亮的按钮
    
    // 设置按钮的图片
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    
    // 监听按钮的点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown]; // UIControlEventTouchDown按钮点击下 就显示高亮；
    
    [self addSubview:btn]; // 将button添加到TabBar上
    
}

#warning 第二步将添加按钮方法抽出 第五步之后 将无效
// 抽取添加按钮方法
- (void)addButtons
{
    // 设置图片时拼接图片名称
    NSString *imageName = nil;
    NSString *selImageName = nil;
    
    for (int i = 0; i < 5; i++) {
        TabBarButton *btn = [TabBarButton buttonWithType:UIButtonTypeCustom]; // 创建按钮，用自定义不显示高亮的按钮
        
        btn.tag = i; // block通知控制器时，传得参数,定义一个tag
        
        imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        // 设置按钮的图片
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown]; // UIControlEventTouchDown按钮点击下 就显示高亮；
        
        [self addSubview:btn]; // 将button添加到TabBar上
        
        // 默认选中第一个button
        if (i == 0) {
            [self btnClick:btn]; // 不能直接调用 btn.selected = YES; 这样不能记录上一次的点击事件，点击下一个按钮不能取消上一个按钮的选中效果
        }
    }
}
#warning 第四步按钮点击的监听方法
// 按钮的监听方法:点击按钮的时候调用
- (void)btnClick:(UIButton *)button
{
    // 取消之前的选中按钮
    _selectButton.selected = NO;
    
    button.selected = YES;
    
    // 按钮点击时，才需要赋值
    _selectButton = button;
    
    // 1.按钮点击时，block通知控制器
    // 需要先判断 是否定义了block
//    if (_block) {
//        _block(button.tag);
//    }
    
    // 2.按钮点击时，代理通知控制器
    // 需要先判断，是否实现代理方法
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
        [_delegate tabBar:self didSelectedIndex:button.tag];
    }
}
#warning 第三步设置按钮的frame
// 创建TabBar时，init方法中，没有给TabBar的frame赋值,所以在init方法中，设置button的frame不准确。
// layout中设置button的frame最准确
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        btn.tag = i; // block通知控制器时，传得参数,定义一个tag
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 默认选中第一个button
        if (i == 0) {
            [self btnClick:btn]; // 不能直接调用 btn.selected = YES; 这样不能记录上一次的点击事件，点击下一个按钮不能取消上一个按钮的选中效果
            }
    }
    
}

@end
