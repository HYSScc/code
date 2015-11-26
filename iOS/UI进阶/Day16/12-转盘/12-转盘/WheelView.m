//
//  WheelView.m
//  12-转盘
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "WheelView.h"
#import "WheelBtn.h"

#define angleToradian(x) ((x) / 180.0 * M_PI)

@interface WheelView()
@property (weak, nonatomic) IBOutlet UIImageView *rotationView; // 旋转的view
@property (nonatomic, weak) UIButton *selectBtn; // 记录选中按钮
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation WheelView

#warning 加载自定义View的类方法
+ (instancetype)wheelView
{
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
}

// 还没有连好线
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"initWithCode---%@", _rotationView);
    }
    return self;
}

// 连好线
#warning 添加按钮 实现界面搭建
- (void)awakeFromNib
{
    NSLog(@"%@", _rotationView);
    
    _rotationView.userInteractionEnabled = YES; // 开启用户交互功能
    
#warning 裁剪图片
    // 裁剪大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *selectImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    // 每一个小图片的尺寸
//    CGFloat imageW = bigImage.size.width / 12 * 2; // 添加*2
//    CGFloat imageH = bigImage.size.height * 2; // 添加*2
    CGFloat imageW = 40 * [UIScreen mainScreen].scale; // scale是2就是retina设备
    CGFloat imageH = 47 * [UIScreen mainScreen].scale; // scale不是2就是非retina设备
    
    for (int i = 0; i < 12; i++) {
        // 1.创建按钮
        WheelBtn *button = [WheelBtn buttonWithType:UIButtonTypeCustom];
        
        // 2.button锚点
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        button.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        
        // 旋转角度
        button.layer.transform = CATransform3DMakeRotation(angleToradian(i * 30), 0, 0, 1);
        
        // 3.尺寸
        button.bounds = CGRectMake(0, 0, 68, 143);
        
//        button.backgroundColor = [UIColor grayColor];
        
        // 4.设置选中的背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
#warning 设置没有选中时的按钮图片
        // 设置按钮的图片
        // image：裁剪的图片
        // rect 裁剪的尺寸
        CGRect clipRect = CGRectMake(i * imageW, 0, imageW, imageH);
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, clipRect); // 不要加* // bigImage.CGImage传人的是像素点 我们clipRect是点 1.设备里面传入的是 960 * 92的那张图片 而我们裁剪的传人的图片是 480 * 46；
        [button setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
#warning 设置选中时的按钮图片
        CGImageRef smallImage1 = CGImageCreateWithImageInRect(selectImage.CGImage, clipRect);
        [button setImage:[UIImage imageWithCGImage:smallImage1] forState:UIControlStateSelected];
        
        button.adjustsImageWhenHighlighted = NO; // 添加 取消highlight状态
        
        // 5.监听点击事件
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        // 最后添加默认选中按钮
        if (i == 0) {
            [self btnClick:button];
        }
        
        [_rotationView addSubview:button];
    }
}
#warning 监听按钮点击
// 设置按钮的状态
- (void)btnClick:(UIButton *)button
{
    _selectBtn.selected = NO; // 设置上一个按钮的select点击状态 关闭
    button.selected = YES; // 设置按钮点击时select状态
    _selectBtn = button; // 赋值
}
#warning 开始旋转 核心动画实现旋转
- (void)startRotating
{
//    CABasicAnimation *anima = [CABasicAnimation animation];
//    
//    anima.keyPath = @"transform.rotation";
//    
//    anima.toValue =@(M_PI * 2);
//    
//    anima.repeatCount = MAXFLOAT;
//    
//    anima.duration = 5;
//    
//    [_rotationView.layer addAnimation:anima forKey:nil];
    
#warning 定时器实现
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
//    
//    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link.paused = NO;
}
#warning 懒加载link
// 懒加载 link定时器
- (CADisplayLink *)link
{
    if (_link == nil) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
        _link = link;
    }
    return _link;
}
#warning 定时器的监听方法
// 这个方法一秒调用60次。  每秒旋转60°  每一次旋转角度 1°
- (void)update
{
    _rotationView.transform = CGAffineTransformRotate(_rotationView.transform, angleToradian(1));
}
#warning 结束旋转
- (void)stopRotating
{
    _link.paused = YES; // 暂停
}

#warning 监听开始选号 按钮
- (IBAction)startSelectNum:(id)sender {
    
    // 点击开始选号是 快速旋转 取消与用户交互 取消 之前的缓慢旋转
    
    // 1.取消用户交互
    _rotationView.userInteractionEnabled = NO;
    // 2.取消慢慢旋转
    [self stopRotating];
    // 3.核心动画 实现快速旋转
        CABasicAnimation *anima = [CABasicAnimation animation];
    
        anima.keyPath = @"transform.rotation";
    
        anima.toValue =@(M_PI * 2);
    
        anima.repeatCount = 5;
    
        anima.duration = 0.5;
    
    anima.delegate = self; // 设置代理 在动画执行完时  开启与用户交互
    
        [_rotationView.layer addAnimation:anima forKey:nil];
}
#warning 动画代理方法
// 动画代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    _rotationView.userInteractionEnabled = YES;
    
    // 让选中按钮停止在 12点钟位置
    CGFloat angle = atan2(_selectBtn.transform.b, _selectBtn.transform.a); // 结果是一个弧度
    // 让转盘反向旋转 这么多度
    _rotationView.transform = CGAffineTransformMakeRotation(-angle);
    
    // 延迟两秒开始旋转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}

@end
