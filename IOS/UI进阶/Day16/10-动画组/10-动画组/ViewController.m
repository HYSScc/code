//
//  ViewController.m
//  10-动画组
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
    CABasicAnimation *rotation = [CABasicAnimation animation];
    CABasicAnimation *position = [CABasicAnimation animation];
    CABasicAnimation *scale = [CABasicAnimation animation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @M_PI_2;
    position.keyPath = @"position";
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 0)]; // 包装
    scale.keyPath = @"transform.scale";
    scale.toValue = @0.5;
    
    group.animations = @[rotation, position, scale];
    
    // 取消反弹
    group.removedOnCompletion = NO; // 不删除动画
    group.fillMode = kCAFillModeForwards; // 保存最前的位置
    
    [_grayView.layer addAnimation:group forKey:nil];
}

@end
