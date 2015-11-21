//
//  View.m
//  01-view的拖拽
//
//  Created by tom-pc on 15/11/16.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "View.h"

@implementation View
// 一个完整的触摸过程
// touchesBegan -> touchesMoved -> touchesEnded

// 触摸开始
/**
   NSArray 集合 有序
   NSSet   集合 无序
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // NSSet里面存了UITouch对象
    // 获取一个touch对象
    UITouch *touch = [touches anyObject];
    
//    NSLog(@"%s----%ld", __func__, touches.count); // 了解touch个数
//    NSLog(@"%ld", touch.tapCount); // 了解点击次数
//    NSLog(@"%ld", touch.phase);
    
}
// 手指移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取一个touch对象
    UITouch *touch = [touches anyObject];
    // 1.获取当前位置
    CGPoint current = [touch locationInView:self]; // 当前UIView的坐标系
    NSLog(@"%@", NSStringFromCGPoint(current));
    // 2.获取上一个点
    CGPoint pre = [touch previousLocationInView:self];
    // 3.偏移量
    CGFloat offsetX = current.x - pre.x;
    CGFloat offsetY = current.y - pre.y;
    
    // 获取视图center
    CGPoint center = self.center;
    center.x += offsetX;
    center.y += offsetY;
    self.center = center;
}
// 触摸结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}
// 触摸被打断，比如打电话过来
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
