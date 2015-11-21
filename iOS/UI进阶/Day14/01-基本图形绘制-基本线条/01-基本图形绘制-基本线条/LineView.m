//
//  LineView.m
//  01-基本图形绘制-基本线条
//
//  Created by tom-pc on 15/11/20.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LineView.h"

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 当视图第一次显示的时候就会调用
// 绘图
- (void)drawRect:(CGRect)rect {
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(0, 125)];
    // 设置终点和控制点
    [path addQuadCurveToPoint:CGPointMake(240, 125) controlPoint:CGPointMake(125, 10)];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextSetLineCap(ctx, kCGLineCapRound); // 圆角
    [[UIColor redColor] setStroke]; // 红色
 
    // 4.渲染上下文到视图
    CGContextStrokePath(ctx);
}





#warning 第二条线的实现(第二条线的新路径设置状态)
- (void)draw2Line
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(10, 125)];
    // 添加一条线到某个点
    [path addLineToPoint:CGPointMake(230, 125)];
    
    //    [path moveToPoint:CGPointMake(10, 10)]; // 添加第二条线的起点
    //    [path addLineToPoint:CGPointMake(125, 125)]; // 添加第二条线的终点
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(10, 10)];
    [path1 addLineToPoint:CGPointMake(230, 125)];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    CGContextAddPath(ctx, path1.CGPath); // 将第二条线的路径添加到上下文
    
    // 设置绘图状态
    // 设置线宽
    CGContextSetLineWidth(ctx, 10); // 线宽
    CGContextSetLineCap(ctx, kCGLineCapRound); // 圆角
    //    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1); // 红色
    [[UIColor redColor] setStroke]; // 红色
    
    // 4.渲染上下文到视图
    CGContextStrokePath(ctx);

}


#warning 第一条线的实现(第一条线的终点为第二条线的起点)
- (void)drawLine
{
    // Drawing code
//    NSLog(@"%@", NSStringFromCGRect(rect)); // rect == self.bounds
    
    // 1.获取上下文
    // CGContextRef CG CoreGraphics
    // Ref 引用
    // 目前学的上下文都跟UIGraphics有关，以后想直接获取上下文，直接敲一个UIGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.设置绘图信息(拼接路径)
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    // 添加一条线到某个点
    [path addLineToPoint:CGPointMake(125, 125)];
    [path addLineToPoint:CGPointMake(240, 10)]; // 添加，这是第二条线，路径都是拼接的，上一条线的终点会成为这条线的起点。
    
    // 3.把路径添加到上下文
    // 直接把UIKit的路径转换成CG CoreGraphics路径 CG开头就能转
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文渲染到视图
    // Stroke描边
    CGContextStrokePath(ctx);
}


@end
