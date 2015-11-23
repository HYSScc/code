//
//  LockView.m
//  04-手势解锁01-布局和圆的选中
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LockView.h"
#import <UIKit/UIKit.h>

@implementation LockView

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
    // 判断点是否点在按钮上
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) { // 点在按钮上
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
    
    if (btn) { // 有触摸按钮的时候才需要选中
        btn.selected = YES;
    }
    
}
// 点移动时调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 当前触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 判断点是否点在按钮上
    // 获取触摸按钮
    UIButton *btn = [self buttonWithPoint:pos];
    
    if (btn) { // 有触摸按钮的时候才需要选中
        btn.selected = YES;
    }

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

@end
