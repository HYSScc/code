//
//  View.m
//  10-矩阵操作
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
    
    // 1.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 注意点：你的路径一定要放在矩阵操作之后
    // 平移上下文
    CGContextTranslateCTM(ctx, 50, 100);
    
    // 旋转上下文
    CGContextRotateCTM(ctx, M_PI_4);
    
    // 缩放上下文
    CGContextScaleCTM(ctx, 0.5, 0.2);
    
    // 2.
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-50, -100, 150, 200)]; // 椭圆
    
    // 3.
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor yellowColor] set];
    // 4.
    CGContextFillPath(ctx);
}


@end
