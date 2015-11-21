//
//  View.m
//  09-图形上下文栈
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "View.h"

@implementation View


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 把ctx拷贝一份放在栈中
    CGContextSaveGState(ctx);
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 125)];
    [path addLineToPoint:CGPointMake(240, 125)];
    // 3.路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 4.渲染
    CGContextStrokePath(ctx); // 描边
    
    // 第二根线
    // 2.拼接路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(125, 10)];
    [path1 addLineToPoint:CGPointMake(125, 240)];
    // 3.路径添加到上下文
    CGContextAddPath(ctx, path1.CGPath);
    
    // 恢复上下文,把栈顶上下文取出，代替当前上下文
    CGContextRestoreGState(ctx);
//    [[UIColor blackColor] setStroke];
//    CGContextSetLineWidth(ctx, 10);
//    CGContextSetLineCap(ctx, kCGLineCapButt);
    // 4.渲染
    CGContextStrokePath(ctx); // 描边
  }


@end
