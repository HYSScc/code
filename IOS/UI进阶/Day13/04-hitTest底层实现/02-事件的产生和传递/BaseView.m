//
//  BaseView.m
//  02-事件的产生和传递
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
// 获取当前方法在哪个类里面调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__); // 无论点击哪个屏幕，打印出来的都是baseView
    NSLog(@"%@", [self class]); // 谁调用打印谁的类名
}

// 找最合适的View
// Point:白色View坐标系上的点
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 1.判断自己是否能接收时间
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }
    // 2.判断点是否在当前View上面
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    // 3.去找有没有比自己更合适的View
    // 从后往前遍历自己的子控件
    NSInteger count = self.subviews.count;
    
    for (NSInteger i = count - 1; i >= 0; i--) {
        // 获取子控件
        UIView *childView = self.subviews[i];
        
        // 转换坐标系
        // 把自己坐标系上的点转换成子控件坐标系上的点
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        
        if (fitView) {
            return fitView;
        }
    }
    // 没有找到比自己更合适的View
    return self;
}


@end
