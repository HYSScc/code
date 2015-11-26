//
//  ViewController.m
//  06-CABasicAnimation
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // 创建图层
    CALayer *layer = [CALayer layer];
    
    layer.position = CGPointMake(100, 100);
    
    layer.bounds = CGRectMake(0, 0, 100, 100);
    
    layer.backgroundColor = [UIColor grayColor].CGColor;
    
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"心"].CGImage); // 导入图片
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 设置动画的属性
//    anima.keyPath = @"transform";
//    anima.keyPath = @"transform.rotation"; // 二维旋转 // 添加
    anima.keyPath = @"transform.scale"; // 二维缩放 // 添加
    
    // 设置属性改变的值
//    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)]; // 包装
//    anima.toValue = @M_PI; // 二维旋转 // 添加
    anima.toValue = @0.5; // 二维缩放 // 添加
    anima.duration = 0.5; // 设置动画时长
    
    // 取消反弹
    // 动画执行完毕之后，不要把动画移除
    anima.removedOnCompletion = NO;
    // 保持最新的位置
    anima.fillMode = kCAFillModeForwards;
    
    anima.repeatCount = MAXFLOAT; // 重复动画的次数
    
    // 给图层添加动画
    [_layer addAnimation:anima forKey:nil];

}

// 动画移动位置
- (void)position
{
    // 1.创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 设置动画的属性
    anima.keyPath = @"position";
    
    // 设置属性改变的值
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)]; // 包装
    anima.duration = 1.5; // 设置动画时长
    
    // 取消反弹
    // 动画执行完毕之后，不要把动画移除
    anima.removedOnCompletion = NO;
    // 保持最新的位置
    anima.fillMode = kCAFillModeForwards;
    
    // 2.给图层添加动画
    [_layer addAnimation:anima forKey:nil];
}
@end
