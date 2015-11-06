//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (nonatomic, strong) UIButton *cover;
@end

@implementation ViewController

// 调整状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIButton *)cover
{
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:_cover];
        
        [_cover addTarget:self action:@selector(smallImage:) forControlEvents:UIControlEventTouchUpInside];
        
        // 添加，动画会从0.0 -> 0.5 -> 1.0 而不是开始动画直接 从0.5 -> 1.0
        _cover.alpha = 0.0;
    }
    return _cover;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)bigImage {
    
    NSLog(@"%s", __func__);
    
    // 1.添加遮罩
    [self cover];
    
    // 2.将图像按钮前置
    // bringSubviewToFont将子视图前置
    [self.view bringSubviewToFront:self.iconButton];
    
    // 3.动画放大图像按钮
    CGFloat w = self.view.bounds.size.width;
    CGFloat h = w;
    CGFloat x = 0;
    CGFloat y = (self.view.bounds.size.height - h) * 0.5 - 21;
    
    // 添加动画(点击按钮后，伴随动画图片放大到指定位置，关键：取消了storyboard中控制器中的一个 use auto layout的选项)
    [UIView animateWithDuration:2.0f animations:^{
        self.iconButton.frame = CGRectMake(x, y, w, h);
        self.cover.alpha = 1.0;
    }];
    
}

// 4.缩小iconButton
- (void)smallImage:(UIButton *)cover
{
    NSLog(@"%s", __func__);
    // 1.插入缩小的动画
    // 动画一旦定义，马上开始，如果没有将删除cover添加到结束动画中，直接写在动画块代码的外面，一开始执行时，蒙版就消失，我们要的效果是动画结束后消失
    [UIView animateWithDuration:2.0f animations:^{
        self.iconButton.frame = CGRectMake(110, 110, 150, 150);
        cover.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        // 2.动画完成删除cover
        // cover是局部变量在这里无法直接删除(方法一在方法添加一个形参，把cover传人到方法中)
//        [cover removeFromSuperview]; // 懒加载后，不需要删除cover
    }];
}
@end
