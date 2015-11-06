//
//  ViewController.m
//  Day2-图片浏览器
//
//  Created by tom-pc on 15/9/29.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

/*
 用纯代码开发的过程
 
 1.确定界面元素，要有什么内容
 2.用代码来搭建界面
 3.编写代码
 */

@interface ViewController ()

/*
 @property 
 1. 创建了getter & setter 方法
 2. 生成一个带_的成员变量，直接读取成员变量不会经过getter方法&setter方法
 */

@property (nonatomic, strong) UILabel *noLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

// 当前显示的照片索引
@property (nonatomic, assign) long index;

@end

@implementation ViewController

// 在viewDidLoad创建界面
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.序号标签
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    //self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.noLabel];
    
    // 2.图像
    CGFloat imageW = 200;
    CGFloat imageH = 200;
    CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
    
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    //_iconImage.backgroundColor = [UIColor redColor];
    //_iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
    [self.view addSubview:self.iconImage];
    
    // 3.描述文字
    CGFloat descY = CGRectGetMaxY(self.iconImage.frame); // 不能bounds，bounds的Y值永远是0
    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
    //_descLabel.text = @"神马表情";
    _descLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.descLabel];
    
    // 4.左边的按钮
    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
    CGFloat centerY = self.iconImage.center.y;
    CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
    _leftButton.center = CGPointMake(centerX, centerY);
    
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.leftButton];
    
    [_leftButton setTag:-1]; // 设定按钮的tag，在调用按钮方法之前
    
    // OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
    [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 5.右边的按钮
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
    
    _rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
    
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.rightButton];
    
    [_rightButton setTag:1]; // 设定按钮的tag，在调用按钮方法之前
    
    // OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
    [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 显示照片信息
    [self showPhotrInfo]; // 解决之前的bug问题，提前初始化照片信息
    
}



/*
 重构的目的:让相同的代码只出现一次
 */
- (void)showPhotrInfo
{
    // 设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%ld/%d", self.index + 1, 5];
    
    // 设置图像和描述
    switch (self.index) {
        case 0:
            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
            self.descLabel.text = @"表情";
            break;
        case 1:
            self.iconImage.image = [UIImage imageNamed:@"bingli"];
            self.descLabel.text = @"病例";
            break;
        case 2:
            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
            self.descLabel.text = @"吃牛扒";
            break;
        case 3:
            self.iconImage.image = [UIImage imageNamed:@"danteng"];
            self.descLabel.text = @"蛋疼";
            break;
        case 4:
            self.iconImage.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"王八";
            break;
    }
    
    self.rightButton.enabled = (self.index != 4);
    self.leftButton.enabled = (self.index != 0);
    
}

// 继续优化（上一张照片和下一张照片）
// OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
- (void)clickButton:(UIButton *)button
{
    // 根据按钮调整当前显示图片的索引
    self.index += button.tag;
    
    [self showPhotrInfo];
    
}

// 上一张照片
- (void)prePhoto
{
    NSLog(@"%s", __func__);
    
    self.index--;
    
    [self showPhotrInfo];
    
//    // 设置序号
//    self.noLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, 5];
//    
//    // 设置图像和描述
//    switch (self.index) {
//        case 0:
//            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
//            self.descLabel.text = @"表情";
//            break;
//        case 1:
//            self.iconImage.image = [UIImage imageNamed:@"bingli"];
//            self.descLabel.text = @"病例";
//            break;
//        case 2:
//            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
//            self.descLabel.text = @"吃牛扒";
//            break;
//        case 3:
//            self.iconImage.image = [UIImage imageNamed:@"danteng"];
//            self.descLabel.text = @"蛋疼";
//            break;
//        case 4:
//            self.iconImage.image = [UIImage imageNamed:@"wangba"];
//            self.descLabel.text = @"王八";
//            break;
//    }
//    
//    self.rightButton.enabled = (self.index != 4);
//    self.leftButton.enabled = (self.index != 0);
    
}

// 下一张照片
- (void)nextPhoto
{
    NSLog(@"%s", __func__);
    
    self.index++;
    
    [self showPhotrInfo];
    
//    // 设置序号
//    self.noLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, 5];
//    
//    // 设置图像和描述
//    switch (self.index) {
//        case 0:
//            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
//            self.descLabel.text = @"表情";
//            break;
//        case 1:
//            self.iconImage.image = [UIImage imageNamed:@"bingli"];
//            self.descLabel.text = @"病例";
//            break;
//        case 2:
//            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
//            self.descLabel.text = @"吃牛扒";
//            break;
//        case 3:
//            self.iconImage.image = [UIImage imageNamed:@"danteng"];
//            self.descLabel.text = @"蛋疼";
//            break;
//        case 4:
//            self.iconImage.image = [UIImage imageNamed:@"wangba"];
//            self.descLabel.text = @"王八";
//            break;
//           }
//    
//    // 控制按钮状态
////    if (self.index == 4) {
////        self.rightButton.enabled = NO;
////    } else {
////        self.rightButton.enabled = YES;
////    }
//    
//    self.rightButton.enabled = (self.index != 4);
//    self.leftButton.enabled = (self.index != 0);
    
}

@end
