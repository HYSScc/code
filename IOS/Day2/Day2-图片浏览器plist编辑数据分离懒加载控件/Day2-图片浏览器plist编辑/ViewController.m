//
//  ViewController.m
//  Day2-图片浏览器plist编辑
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

@property (nonatomic, strong) UILabel *noLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, assign) long index; // 当前显示的照片索引
@property (nonatomic, strong) NSArray *imageList; // 声明图片信息数组

@end

@implementation ViewController

/*
 懒加载（延迟加载），通过getter实现
 
 效果：让对象在最需要的时候才创建
 */
- (NSArray *)imageList
{
    NSLog(@"读取图像信息");
    if (_imageList == nil) {
        NSLog(@"实例化数组");
        
        // "包" Bundle [NSBundle mainBundle]编译安装之后对应的程序包
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageList" ofType:@"plist"];
        NSLog(@"%@", path);
        
        // 在OC中ContentsOfFile，通常需要完整地路径
        _imageList = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"%@", _imageList);
        
//        NSDictionary *dic1 = @{@"name" : @"biaoqingdi", @"desc" : @"表情1"};
//        NSDictionary *dic2 = @{@"name" : @"bingli", @"desc" : @"病例1"};
//        NSDictionary *dic3 = @{@"name" : @"chiniupa", @"desc" : @"吃牛扒1"};
//        NSDictionary *dic4 = @{@"name" : @"danteng", @"desc" : @"蛋疼1"};
//        NSDictionary *dic5 = @{@"name" : @"wangba", @"desc" : @"王八1"};
//        
//        _imageList = @[dic1, dic2, dic3, dic4, dic5];
    }
    
    return _imageList;
}

#pragma mark - 控件的懒加载
// 在getter方法中，不要再使用self，否则会重复调用getter方法，造成死循环
- (UILabel *)noLabel
{
    if (_noLabel == nil) {
        // 1.序号标签
        _noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
        _noLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_noLabel];
    }
    
    return _noLabel;
}

- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        // 2.图像
        CGFloat imageW = 200;
        CGFloat imageH = 200;
        CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
        CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
        
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        [self.view addSubview:self.iconImage];
    }
    
    return _iconImage;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        // 3.描述文字
        CGFloat descY = CGRectGetMaxY(self.iconImage.frame); // 不能bounds，bounds的Y值永远是0
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        // 需要Label具有足够的高度，不限制显示的行数
        _descLabel.numberOfLines = 0;
        [self.view addSubview:self.descLabel];
    }
    return _descLabel;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
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
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        // 5.右边的按钮
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
        
        CGFloat centerY = self.iconImage.center.y;
        CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
        _rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
        
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        [self.view addSubview:self.rightButton];
        
        [_rightButton setTag:1]; // 设定按钮的tag，在调用按钮方法之前
        
        // OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
        [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.序号标签
//    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
//    self.noLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.noLabel];
    
    // 2.图像
//    CGFloat imageW = 200;
//    CGFloat imageH = 200;
//    CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
//    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
//    
//    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
//    [self.view addSubview:self.iconImage];
    
    // 3.描述文字
//    CGFloat descY = CGRectGetMaxY(self.iconImage.frame); // 不能bounds，bounds的Y值永远是0
//    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
//    _descLabel.textAlignment = NSTextAlignmentCenter;
//    // 需要Label具有足够的高度，不限制显示的行数
//    _descLabel.numberOfLines = 0;
//    [self.view addSubview:self.descLabel];
    
    // 4.左边的按钮
//    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
//    CGFloat centerY = self.iconImage.center.y;
//    CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
//    _leftButton.center = CGPointMake(centerX, centerY);
//    
//    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
//    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
//    [self.view addSubview:self.leftButton];
//    
//    [_leftButton setTag:-1]; // 设定按钮的tag，在调用按钮方法之前
//    
//    // OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
//    [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 5.右边的按钮
//    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
//    
//    _rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
//    
//    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
//    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
//    [self.view addSubview:self.rightButton];
//    
//    [_rightButton setTag:1]; // 设定按钮的tag，在调用按钮方法之前
//    
//    // OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
//    [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//        // 显示照片信息
    [self showPhotrInfo]; // 解决之前的bug问题，提前初始化照片信息
    
}

/*
 重构的目的:让相同的代码只出现一次
 */
- (void)showPhotrInfo
{
    // 设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%ld/%d", self.index + 1, 5];
    
    //设置图像和描述2
    self.iconImage.image = [UIImage imageNamed:self.imageList[self.index][@"name"]];
    self.descLabel.text = self.imageList[self.index][@"desc"];
    
       self.rightButton.enabled = (self.index != 4);
    self.leftButton.enabled = (self.index != 0);
    
}

// 继续优化（上一张照片和下一张照片）
// OC中，很多方法的第一个参数，都是触发该方法的对象(clickButton:)
- (void)clickButton:(UIButton *)button
{
    // 根据按钮调整当前显示图片的索引
    self.index += button.tag; // 代替了self.index++和self.index--
    
    [self showPhotrInfo];
    
}

@end
