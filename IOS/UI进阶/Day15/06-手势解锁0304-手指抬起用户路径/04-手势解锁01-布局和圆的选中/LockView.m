//
//  LockView.m
//  04-手势解锁01-布局和圆的选中
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LockView.h"
#import <UIKit/UIKit.h>

@interface LockView()
@property (nonatomic, strong) NSMutableArray *btns; // 保存点击按钮的数组
@property (nonatomic, assign) CGPoint moveP; // 获取当前移动点的位置
@end

@implementation LockView
// 懒加载
- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

// 解析XIB的时候调用
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self addBtns];
    }
    return self;
}

// 添加Btn子控件的方法
- (void)addBtns
{
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i; // 添加btn tag
        
        // 设置按钮状态
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected]; // select手动实现
        
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside]; // 不能实现
        
        // 不允许用户交互,点击btn时，交给view管理
        btn.userInteractionEnabled = NO;
        
        [self addSubview:btn];
    }
}

//- (void)btnClick:(UIButton *)btn
//{
//    btn.selected = YES; // 手指抬起的时候，显示高亮图片
//}

// 获取当前触摸点的位置
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    // 当前触摸点
    UITouch *touch = [touches anyObject];
    // 获取当前位置
    return [touch locationInView:self];
}

// 获取触摸按钮判断点是否在按钮上
- (UIButton *)buttonWithPoint:(CGPoint)point
{
    // 添加，细节处理
    CGFloat wh = 30; // 设置内部小矩形的宽度为30
    
    // 判断点是否点在按钮上
    for (UIButton *btn in self.subviews) {
        
        // 添加，细节处理
        CGFloat x = btn.center.x - wh * 0.5;
        CGFloat y = btn.center.y - wh * 0.5;
        CGRect frame = CGRectMake(x, y, wh, wh);
        
        if (CGRectContainsPoint(frame, point)) { // 点在按钮上
            return btn;
        }
        
    }
    return nil;
}

// 点击view时调用方法，点击按钮时，不调用这个方法。2。设置完btn.userInteractionEnabled = NO;点击按钮时调用这个方法，且按钮不高亮
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    
    // 当前触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 判断点是否点在按钮上
    // 获取触摸按钮
    UIButton *btn = [self buttonWithPoint:pos];
    
    if (btn && btn.selected == NO) { // 有触摸按钮的时候才需要选中
        btn.selected = YES;
        
        [_btns addObject:btn]; // 添加,将点击的按钮添加到数组中
    }
    
}
// 点移动时调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 当前触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    _moveP = pos; // 添加
    
    // 判断点是否点在按钮上
    // 获取触摸按钮
    UIButton *btn = [self buttonWithPoint:pos];
    
    if (btn && btn.selected == NO) { // 有触摸按钮的时候才需要选中
        btn.selected = YES;
        
        [_btns addObject:btn]; // 添加,将点击的按钮添加到数组中
    }
    
    // 重绘
    [self setNeedsDisplay];
}

#define xBtnW 74
#define xBtnH 74
#define xCount 3

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat col = 0;
    CGFloat row = 0;
    
    CGFloat marginW = (self.bounds.size.width - xCount * xBtnW) / (xCount + 1);
    CGFloat marginH = (self.bounds.size.height - xCount * xBtnH) / (xCount + 1);
    
    
    // 给按钮设置位置
    for (int i = 0; i < self.subviews.count; i++) {
        
        UIButton *button = self.subviews[i];
        
        col = i % xCount;
        row = i / xCount;
        
        CGFloat x = marginW + col * (marginW + xBtnW);
        CGFloat y = marginH + row * (marginH + xBtnH);
        
        button.frame = CGRectMake(x, y, xBtnW, xBtnW);
    }
}
// 画线
- (void)drawRect:(CGRect)rect
{
    // 如果按钮数组中没有值 直接返回
    if (!self.btns.count) return;
    
    // 拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
//    UIButton *btn = _btns[0]; // 拿到第一个点击的按钮
//    UIButton *btn1 = _btns[1]; // 第二个按钮
//    [path moveToPoint:btn.center]; // 设置第一个点击的按钮的中点为起点
//    [path moveToPoint:btn1.center]; // 设置第二个
    
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn = _btns[i];
        
        if (i == 0) {
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    
    // 连接多余的那根线
    [path addLineToPoint:_moveP]; // 这是添加手指移动到拿就连接到拿得那根线。
    [[UIColor greenColor] setStroke];
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineCapRound; // 圆角
    // 渲染到视图
    [path stroke];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // 判断用户输入了什么东西
    NSMutableString *str = [NSMutableString string];
    
    for (UIButton *btn in self.btns) {
        [str appendFormat:@"%ld", btn.tag]; // 拼接按钮的tag
    }
    NSLog(@"%@", str);
    
    // 1.取消所有按钮的选中
    [self.btns makeObjectsPerformSelector:@selector(setSelected:) withObject:NO];
    
    // 2.清空数组
    [self.btns removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}
@end
