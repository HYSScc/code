//
//  ViewController.m
//  04-隐式动画
//
//  Created by tom-pc on 15/11/25.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *layer;
@end

@implementation ViewController

// 视图一加载就调用
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 隐式动画，设置在自定义的Layer上，所以不需要创建UIView。
    CALayer *layer = [CALayer layer]; // 类方法快速创建
    
    // 尺寸,颜色
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor blackColor].CGColor;
//    layer.cornerRadius = 50; // 设置圆角
    
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
}

// 动画需要设置在显示的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject]; // 拿到触摸点
    CGPoint pos = [touch locationInView:self.view]; // 拿到点
    
    // 开启一个事务
    [CATransaction begin];
//    [CATransaction setDisableActions:YES]; // 取消隐式动画。
//    _layer.position = CGPointMake(100, 100); // 平移
    _layer.borderWidth = arc4random_uniform(5) + 1; // 加上一 范围是1~10
//    _layer.borderColor = [UIColor purpleColor].CGColor;
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    _layer.borderColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor; // 边框颜色变化
    CGFloat br = arc4random_uniform(256) / 255.0;
    CGFloat bg = arc4random_uniform(256) / 255.0;
    CGFloat bb = arc4random_uniform(256) / 255.0;
    _layer.backgroundColor = [UIColor colorWithRed:br green:bg blue:bb alpha:1].CGColor; // 背景颜色变化
    _layer.cornerRadius = arc4random_uniform(100);
    _layer.position = pos; // 设置位置。
    
    // 关闭一个事务
    [CATransaction commit];
}

@end
