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

@end

@implementation ViewController

// 在viewDidLoad创建界面
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.序号标签
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.noLabel];
    
    // 2.图像
    CGFloat imageW = 200;
    CGFloat imageH = 200;
    CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
    
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    //_iconImage.backgroundColor = [UIColor redColor];
    _iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
    [self.view addSubview:self.iconImage];
    
    // 3.描述文字
    CGFloat descY = CGRectGetMaxY(self.iconImage.frame); // 不能bounds，bounds的Y值永远是0
    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
    _descLabel.text = @"神马表情";
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
    
    // 5.右边的按钮
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
    
    _rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
    
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.rightButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
