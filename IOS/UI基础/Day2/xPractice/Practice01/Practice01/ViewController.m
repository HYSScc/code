//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *noLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

// 当前显示的照片索引
@property (nonatomic, assign) long index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.标签
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.noLabel];
    
    // 2.图像
    CGFloat imageW = 200;
    CGFloat imageH = 200;
    CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    self.iconImage.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.iconImage];
    
    // 3.描述文字
    CGFloat nameY = CGRectGetMaxY(self.iconImage.frame);
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, nameY, self.view.bounds.size.width, 100)];
    self.nameLabel.text = @"123";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.nameLabel];
    
    // 左边按钮
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
    
    CGFloat centerY = self.iconImage.center.y;
    CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
    self.leftButton.center = CGPointMake(centerX, centerY);
    
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [self.view addSubview:self.leftButton];
    
    [self.leftButton setTag:-1];
    
    [self.leftButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    // 右边按钮
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
    
    self.rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
    
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.view addSubview:self.rightButton];
    
    [self.rightButton setTag:1];
    
    [self.rightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    // 初始化第一张图片信息
    [self showPhoto];
}

//- (void)next
//{
//    NSLog(@"%s", __func__);
//    
//    self.index++;
//    
//    [self showPhoto];
    
//    // 设置序号
//    self.noLabel.text = [NSString stringWithFormat:@"%ld/%d", self.index + 1, 5];
//    // 设置图像和描述
//    switch (self.index) {
//        case 0:
//            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
//            self.nameLabel.text = @"表情";
//            break;
//        case 1:
//            self.iconImage.image = [UIImage imageNamed:@"bingli"];
//            self.nameLabel.text = @"病例";
//            break;
//        case 2:
//            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
//            self.nameLabel.text = @"吃牛扒";
//            break;
//        case 3:
//            self.iconImage.image = [UIImage imageNamed:@"danteng"];
//            self.nameLabel.text = @"蛋疼";
//            break;
//        case 4:
//            self.iconImage.image = [UIImage imageNamed:@"wangba"];
//            self.nameLabel.text = @"王八";
//            break;
//     }
//    // 控制按钮状态
//    if (self.index == 4) {
//        self.rightButton.enabled = NO;
//    }else{
//        self.rightButton.enabled = YES;
//    }
    
//}

//- (void)pre
//{
//    NSLog(@"%s", __func__);
//    
//    self.index--;
//    
//    [self showPhoto];
//}
- (void)showPhoto
{
    // 设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%ld/%d", self.index + 1, 5];
    // 设置图像和描述
    switch (self.index) {
        case 0:
            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
            self.nameLabel.text = @"表情";
            break;
        case 1:
            self.iconImage.image = [UIImage imageNamed:@"bingli"];
            self.nameLabel.text = @"病例";
            break;
        case 2:
            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
            self.nameLabel.text = @"吃牛扒";
            break;
        case 3:
            self.iconImage.image = [UIImage imageNamed:@"danteng"];
            self.nameLabel.text = @"蛋疼";
            break;
        case 4:
            self.iconImage.image = [UIImage imageNamed:@"wangba"];
            self.nameLabel.text = @"王八";
            break;
    }
    self.rightButton.enabled = (self.index != 4);
    self.leftButton.enabled = (self.index != 0);

}

// 重构按钮next、pre
- (void)click:(UIButton *)button
{
    self.index += button.tag;
    
    [self showPhoto];
}
@end
