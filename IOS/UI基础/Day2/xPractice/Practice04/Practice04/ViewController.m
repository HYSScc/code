//
//  ViewController.m
//  Practice04
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)tomAnimationWithName:(NSString *)name count:(NSInteger)count
{
    // 动画正在进行，直接退出
    if ([self.tom isAnimating]) return;
    
    // 动画图片数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 添加动画播放的图片
    for (int i = 0; i < count; i++) {
        // 图像名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
    }
    // 设置动画数组
    self.tom.animationImages = arrayM;
    // 重复一次
    self.tom.animationRepeatCount = 1;
    // 动画时长
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;
    
    // 开始动画
    [self.tom startAnimating];
    
    // 结束动画，清理动画数组
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration];
}

- (IBAction)knock {
    [self tomAnimationWithName:@"knockout" count:81];
}

- (IBAction)eat {
}

- (IBAction)cymbal {
}

- (IBAction)drink {
}

- (IBAction)pie {
}

- (IBAction)fart {
}

- (IBAction)scratch {
}
@end
