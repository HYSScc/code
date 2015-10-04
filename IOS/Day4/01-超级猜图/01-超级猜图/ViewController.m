//
//  ViewController.m
//  01-超级猜图
//
//  Created by tom-pc on 15/10/4.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

//** 调整状态栏颜色 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent; // 亮色状态栏
                                         // UIStatusBarStyleDefault黑色状态栏
}

//** 大图 */
- (IBAction)bigImage {
    
    // 1.添加一个遮罩(遮罩应该是一个按钮类型的)设置完之后，点击按钮，屏幕显现半透明
    UIButton *cover = [[UIButton alloc] initWithFrame:self.view.bounds];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5]; // 颜色设定
    [self.view addSubview:cover];
    
    // 1.4.添加缩小的动画，按钮监听
    [cover addTarget:self action:@selector(smallImage:) forControlEvents:UIControlEventTouchUpInside];
    
    // 1.5 发现动画中，蒙版是慢慢地变暗，或慢慢地变量
    cover.alpha = 0.0; // 透明
    
    // 2.将图像按钮弄到最前面
    // bringSubviewToFront将子视图前置
    [self.view bringSubviewToFront:self.iconButton]; //将前面声明的iconButton传人方法，iconButton就是UIButton *
    
    // 3.动画放大图像按钮
    CGFloat w = self.view.bounds.size.width;
    CGFloat h = w;
    CGFloat y = (self.view.bounds.size.height - h) * 0.5 - 21;
    CGFloat x = 0;
    
    // 添加动画(点击按钮后，伴随动画图片放大到指定位置，关键：取消了storyboard中控制器中的一个 use auto layout的选项)
    [UIView animateWithDuration:2.0f animations:^{
        self.iconButton.frame = CGRectMake(x, y, w, h);
        cover.alpha = 1.0;
        // 1.5 完全显示（完全显示的是透明度，之前的颜色已经设置好了，不要搞混）
    }];
    
}

//** 小图 */
- (void)smallImage:(UIButton *)cover
{
    // 1.3 插入缩小的动画代码
    // 动画一旦定义，马上开始，如果没有将删除cover添加到结束动画中，直接写在动画块代码的外面，一开始执行时，蒙版就消失，我们要的效果是动画结束后消失
    [UIView animateWithDuration:2.5f animations:^{
        // 1.将图像恢复初始位置
        self.iconButton.frame = CGRectMake(110, 110, 150, 150);
        cover.alpha = 0.0; // 1.5
    } completion:^(BOOL finished) {
        // 2.动画完成之后删除cover
        // cover是局部变量在这里无法直接删除(方法一在方法添加一个形参，把cover传人到方法中)
        [cover removeFromSuperview];
    }];
    
    
    
}


@end
