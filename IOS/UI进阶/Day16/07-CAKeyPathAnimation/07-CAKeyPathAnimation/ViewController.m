//
//  ViewController.m
//  07-CAKeyPathAnimation
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    // 设置动画属性
    animation.keyPath = @"position";
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    animation.path = path.CGPath;
    animation.duration = 1;
    
    [_grayView.layer addAnimation:animation forKey:nil];
}


- (void)value
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    // 设置动画属性
    animation.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointZero];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(160, 160)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(270, 0)];
    
    animation.values = @[v1, v2, v3];
    animation.duration = 1;
    
    //添加动画到layer
    [_grayView.layer addAnimation:animation forKey:nil];
}
@end
