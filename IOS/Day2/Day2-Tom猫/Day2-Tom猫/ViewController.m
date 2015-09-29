//
//  ViewController.m
//  Day2-Tom猫
//
//  Created by tom-pc on 15/9/29.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController

- (IBAction)eatBird
{
    // 序列帧动画 -> 顺序播放一组图片
    
    // 动画图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 添加动画播放的图片
    for (int i = 0; i < 40; i++) {
        // 图像名称
        NSString *imageName = [NSString stringWithFormat:@"eat_%02d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [arrayM addObject:imageName];
        NSLog(@"%@", imageName);
    }
    self.tom.animationImages = arrayM;
    
    // 开始动画
    [self.tom startAnimating];
}

@end
