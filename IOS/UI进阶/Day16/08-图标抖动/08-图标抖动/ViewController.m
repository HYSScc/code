//
//  ViewController.m
//  08-图标抖动
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

#define angle2radian(x) ((x) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [_iamgeView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
        
        anima.keyPath = @"transform.rotation";
        
//        anima.values = @[@(angle2radian(-5)), @(angle2radian(5))]; // 数组里面是浮点数 用@() 包装一下 常量的时候不需要括号
        // 重点 解决从 5° 直接跳转到 -5°时没有动画的 bug 在源代码基础上添加 从 5°到 -5°的动画
        anima.values = @[@(angle2radian(-5)), @(angle2radian(5)), @(angle2radian(-5))];
        
        anima.repeatCount = MAXFLOAT; // 重复
        
        [_iamgeView.layer addAnimation:anima forKey:nil];
    }
}

@end
