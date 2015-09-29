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

/*
 重构--抽取代码
 
 方法：
 1> 将重复的代码复制到新的方法中
 2> 根据需要调整参数
 
 关于图像的实例化
 
 imageNamed: 系统推荐使用的，但是图像实例化之后的释放由系统负责
 如果要自己释放图片，不能使用imageNamed方法
 
 而需要使用imageWithContentsOfFile
 
 提示：如果放在Images.xcassets中的图片，不能使用imageWithContentsOfFile
    Images.xcassets中不要存放大的，不常用的图片
*/

- (void)tomAnimationWithName:(NSString *)name count:(NSInteger)count
{
    // 如果正在动画，直接退出
    if ([self.tom isAnimating]) return;
    
    // 动画图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 添加动画播放的图片
    for (int i = 0; i < count; i++) {
        // 图像名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        
        //UIImage *image = [UIImage imageNamed:imageName];
        //[arrayM addObject:image];
        
        // ContentsOfFile需要全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
        
        NSLog(@"%@", imageName);
    }
    
    // 设置动画数组
    self.tom.animationImages = arrayM;
    // 重复一次
    self.tom.animationRepeatCount = 1;
    // 动画时长
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;
    
    // 开始动画
    [self.tom startAnimating];
    
    //动画结束后，清理动画数组
    //self.tom.animationImages = nil;
    // performSelector定义在NSObject分类中
    //[self performSelector:@selector(clearup) withObject:nil afterDelay:self.tom.animationDuration];
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration];

}

//- (void)clearup
//{
//    NSLog(@"%s", __func__);
//    self.tom.animationImages = nil;
//}


- (IBAction)knockout
{
    [self tomAnimationWithName:@"knockout" count:81];

}

- (IBAction)eatBird
{
    [self tomAnimationWithName:@"eat" count:40];
    
//    // 序列帧动画 -> 顺序播放一组图片
//    
//    // 动画图片的数组
//    NSMutableArray *arrayM = [NSMutableArray array];
//    
//    // 添加动画播放的图片
//    for (int i = 0; i < 40; i++) {
//        // 图像名称
//        NSString *imageName = [NSString stringWithFormat:@"eat_%02d.jpg", i];
//        UIImage *image = [UIImage imageNamed:imageName];
//        [arrayM addObject:image];
//        NSLog(@"%@", imageName);
//    }
//    
//    // 设置动画数组
//    self.tom.animationImages = arrayM;
//    // 重复一次
//    self.tom.animationRepeatCount = 1;
//    // 动画时长
//    self.tom.animationDuration = self.tom.animationImages.count * 0.075;
//    
//    // 开始动画
//    [self.tom startAnimating];

}


@end
