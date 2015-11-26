//
//  ViewController.m
//  09-转场动画
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) int index; // 角标
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index = 1;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _index++;
    
    if (_index == 4) {
        _index = 1;
    }
    NSString *fileName = [NSString stringWithFormat:@"%d", _index]; // 拼接字符串
    _imageView.image = [UIImage imageNamed:fileName];
    
    // 创建动画
    CATransition *animation = [CATransition animation];
    
//    animation.type = @"cube"; // 正方形转场动画
//    animation.type = @"push"; // 右拉效果
//    animation.type = @"rippleEffect"; // 水滴效果
    animation.type = @"pageCurl"; // 翻页
    
    animation.subtype = kCATransitionFromLeft; // 设置方向
    
    animation.startProgress = 0.8; // 设置动画的开始阶段
    
    [_imageView.layer addAnimation:animation forKey:nil];
}
@end
