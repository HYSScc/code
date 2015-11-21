//
//  DrawViewController.m
//  06-抽屉效果-复杂滑动效果01
//
//  Created by tom-pc on 15/11/19.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "DrawViewController.h"

@interface DrawViewController ()
@property (nonatomic, weak) UIView *mainView;
@property (nonatomic, weak) UIView *leftView;
@property (nonatomic, weak) UIView *rightView;
@end

@implementation DrawViewController

- (void)viewDidLoad {
    // UIViewController
    [super viewDidLoad];
    
    // 1.添加子控件
    [self addchildView];
    
    // 2.KVO监听
    // addObserver 观察者
    // forKeyPath 就认为是属性，填写view属性，不能写结构体的属性（frame.origin）
    // options 监听新值的改变 NSKeyValueObservingOptionNew
    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

// 添加监听，当frame的新值改变的时候，会调用下面方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    NSLog(@"%@", change);
    NSLog(@"%@", NSStringFromCGRect(_mainView.frame));
    
    if (_mainView.frame.origin.x < 0) { // 往左移动
        // 显示右边View
        _rightView.hidden = NO;
        // 隐藏左边View
        _leftView.hidden = YES;
    }else if (_mainView.frame.origin.x > 0 ){ // 往右边移动
        // 显示左边View
        _leftView.hidden = NO;
        // 隐藏右边View
        _rightView.hidden = YES;
    }
}

#warning 第一步
- (void)addchildView
{
    // leftView
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    _leftView = leftView;
    
    // rightView
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rightView];
    _rightView = rightView;
    
    // mainView
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:mainView];
    _mainView = mainView;
}
#warning 监听触摸事件
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取一个touch对象，就是一个手指的点击
    UITouch *touch = [touches anyObject];
    // 1.获取当前点位置
    CGPoint current = [touch locationInView:self.view]; // self.view的坐标系
    // 2.获取上一个点
    CGPoint prepoint = [touch previousLocationInView:self.view];
    // X轴偏移量:当手指移动一点的时候，X移动了多少
    CGFloat offsetX = current.x - prepoint.x;
    
    
    self.mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
    
}
// 当手指移动一点的时候，X移动了多少,来改变frame
- (CGRect)getCurrentFrameWithOffsetX:(CGFloat)offsetX
{
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // X轴偏移量:当手指移动一点的时候，X移动了多少
    CGFloat offsetY = offsetX * 80 / 375;
    CGFloat scale = (screenH - 2 * offsetY) / screenH;
    if (self.mainView.frame.origin.x < 0) {
        scale = (screenH + 2 * offsetY) / screenH;
    }
    // 获取主视图center
    CGRect frame = self.mainView.frame;
    
    frame.origin.x += offsetX;
    frame.size.height = frame.size.height * scale;
    frame.size.width = frame.size.width * scale;
    frame.origin.y = (screenH - frame.size.height) * 0.5;
    
    return frame;

}


@end
