//
//  WhiteView.m
//  02-事件的产生和传递
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

// 什么时候调用：当事件传递给一个控件的时候就会调用
// 作用：找最合适的view
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 寻找最合适的View
//    // (super调用的父类方法就是BaseView，BaseView默认没有实现hitTest方法，再去UIView中找，系统默认实现，调用的是UIView方法，系统默认的方法)
//    UIView *fitView = [super hitTest:point withEvent:event];
//    NSLog(@"%@", fitView);
//    return fitView;
//}

// 判断点是否在方法调用者的坐标系上
// point：是方法调用者的坐标系上的点
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    return NO;
//}

//// 找最合适的View
//// Point:白色View坐标系上的点
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 1.判断自己是否能接收时间
//    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
//        return nil;
//    }
//    // 2.判断点是否在当前View上面
//    if ([self pointInside:point withEvent:event]) {
//        return nil;
//    }
//    // 3.去找有没有比自己更合适的View
//    // 从后往前遍历自己的子控件
//    NSInteger count = self.subviews.count;
//    
//    for (NSInteger i = count - 1; i >= 0; i--) {
//        // 获取子控件
//        UIView *childView = self.subviews[i];
//        
//        // 转换坐标系
//        // 把自己坐标系上的点转换成子控件坐标系上的点
//        CGPoint childPoint = [self convertPoint:point fromCoordinateSpace:childView];
//        
//        UIView *fitView = [childView hitTest:childPoint withEvent:event];
//        
//        if (fitView) {
//            return fitView;
//        }
//    }
//    // 没有找到比自己更合适的View
//    return self;
//}

@end
