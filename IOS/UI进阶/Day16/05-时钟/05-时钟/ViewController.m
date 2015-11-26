//
//  ViewController.m
//  05-时钟
//
//  Created by tom-pc on 15/11/25.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

#define angletoradian(x) ((x) / 180.0 * M_PI) // 转化为弧度
#define perSecondA 6  // 每一秒秒针旋转6°
#define perMinuteA 6  // 每一分分针旋转6°
#define perHourA 30  // 每小时时针旋转30°
#define perMinuteHourA 0.5 // 每分钟时针旋转0.5°

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockImageView;
@property (nonatomic, strong) CALayer *second;
@property (nonatomic, strong) CALayer *minute;
@property (nonatomic, strong) CALayer *hour;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加秒针
    [self addSecond];
    
    // 2.添加分针
    [self addMintue];
    
    // 3.添加时针
    [self addHour];
}

// 定时器监听方法
- (void)update
{
    NSLog(@"update"); // 每一秒输出
#warning 第二步获取秒数计算度数实现定位
   
    // 获取秒数
    // 获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取日期组件
    NSDateComponents *compoents = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    // 获取秒数
    CGFloat sec = compoents.second;
    NSLog(@"%f", sec);
    
    // 获取分钟
    CGFloat min = compoents.minute; // 添加
    
    // 获取小时
    CGFloat hour = compoents.hour; // 添加
    
    // 根据秒数 获取旋转角度
    CGFloat secondA = sec * perSecondA;
    //    secondA = secondA / 180.0 * M_PI; // 转化为弧度
    
    // 根据分钟 获取旋转角度
    CGFloat minuteA = min * perMinuteA;
    
    // 根据小时 获取旋转角度
    CGFloat hourA = hour * perHourA;
    hourA += min * perMinuteHourA; // 关键一步
    
    _second.transform = CATransform3DMakeRotation(angletoradian(secondA), 0, 0, 1);
    _minute.transform = CATransform3DMakeRotation(angletoradian(minuteA), 0, 0, 1);
    _hour.transform = CATransform3DMakeRotation(angletoradian(hourA), 0, 0, 1);

}

// 添加秒针
- (void)addSecond
{
#warning 第一步初始化秒针
    CGFloat imageW = _clockImageView.bounds.size.width;
    CGFloat imageH = _clockImageView.bounds.size.height;
    
    // 添加秒针
    CALayer *second = [CALayer layer];
    
    // 设置锚点
    second.anchorPoint = CGPointMake(0.5, 1);
    
    // 设置位置
    second.position = CGPointMake(imageW * 0.5, imageH * 0.5); // 不能设置second.center。因为center不是以自己view为坐标原点
    
    // 设置尺寸
    second.bounds = CGRectMake(0, 0, 1, imageH * 0.5 - 20);
    second.backgroundColor = [UIColor grayColor].CGColor;
    
    [_clockImageView.layer addSublayer:second];
    
    _second = second;
    
#warning 第三步创建定时器实现每一秒工作
    // 创建定时器(不需要刷新屏幕)
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
#warning 第四步bug修复手动获取当前时间
    [self update];
}

// 添加分针
- (void)addMintue
{
    CGFloat imageW = _clockImageView.bounds.size.width;
    CGFloat imageH = _clockImageView.bounds.size.height;
    
    // 添加分针
    CALayer *minute = [CALayer layer];
    
    // 设置锚点
    minute.anchorPoint = CGPointMake(0.5, 1);
    
    // 设置位置
    minute.position = CGPointMake(imageW * 0.5, imageH * 0.5); // 不能设置second.center。因为center不是以自己view为坐标原点
    
    // 设置尺寸
    minute.bounds = CGRectMake(0, 0, 2, imageH * 0.5 - 30);
    minute.backgroundColor = [UIColor blueColor].CGColor;
    
    [_clockImageView.layer addSublayer:minute];
    
    _minute = minute;
    
#warning 第三步创建定时器实现每一秒工作
    // 创建定时器(不需要刷新屏幕)
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
#warning 第四步bug修复手动获取当前时间
    [self update];

}

// 添加时针
- (void)addHour
{
    CGFloat imageW = _clockImageView.bounds.size.width;
    CGFloat imageH = _clockImageView.bounds.size.height;
    
    // 添加分针
    CALayer *hour = [CALayer layer];
    
    // 设置锚点
    hour.anchorPoint = CGPointMake(0.5, 1);
    
    // 设置位置
    hour.position = CGPointMake(imageW * 0.5, imageH * 0.5); // 不能设置second.center。因为center不是以自己view为坐标原点
    
    // 设置尺寸
    hour.bounds = CGRectMake(0, 0, 2, imageH * 0.5 - 50);
    hour.backgroundColor = [UIColor blackColor].CGColor;
    
    [_clockImageView.layer addSublayer:hour];
    
    _hour = hour;
    
#warning 第三步创建定时器实现每一秒工作
    // 创建定时器(不需要刷新屏幕)
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
#warning 第四步bug修复手动获取当前时间
    [self update];

}
@end
