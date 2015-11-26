//
//  ViewController.m
//  11-UIView封装的动画
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 核心动画都是假象，不能改变layer的真是属性
// 展示的位置和实际的位置不同。实际位置永远在最开始位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _index++;
    
    if (_index == 4) {
        _index = 1;
    }
    NSString *fileName = [NSString stringWithFormat:@"%d", _index]; // 拼接字符串
    
    _imageView.image = [UIImage imageNamed:fileName];
    
    // UIView 转场动画
    [UIView transitionWithView:_imageView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:nil completion:nil];
    
}

// 核心动画 UIView 实现简单 平移(研究代理方法 )
- (void)position
{
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    anima.keyPath = @"position";
    
    anima.fromValue = [NSValue valueWithCGPoint:CGPointZero]; // 从0开始 从锚点开始
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    anima.duration = 1.5;
    
    anima.delegate = self; // 动画代理不用遵守协议 // 每个View都有 // 代理方法有 开始 结束
    
    [_grayView.layer addAnimation:anima forKey:nil];
}

// 动画代理方法 结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@", NSStringFromCGPoint(_grayView.layer.position));
}
@end
