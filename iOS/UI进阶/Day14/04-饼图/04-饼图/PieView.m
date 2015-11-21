//
//  PieView.m
//  04-饼图
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (UIColor *)randomColor
{
    /**
     颜色有两种表现形式 RGB RGA
     RGB 24
     R,G,B每个颜色通道8位
     8的二进制取值范围 255
     R,G,B每个颜色取值 0 ~ 255
     
     120 / 255.0
     */
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 120;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;

    
    NSArray *data = @[@25, @25, @50];
    
    for (NSNumber *number in data) {
        // 2.拼接路径
        // 第一个扇形
        startA = endA;
        angle = number.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        
        // 3.把路径添加到上下文
        CGContextAddPath(ctx, path.CGPath);
        [[self randomColor] setFill];
        
        // 4.渲染
        CGContextFillPath(ctx);
    }
}
// 点击view起到变色效果
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 重绘
    [self setNeedsDisplay];
}




#warning 扇形实现
- (void)drawPie
{
    NSArray *data = @[@25, @25, @50];
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 120;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    // 第一个扇形
    angle = 25 / 100.0 * M_PI * 2; // 这里100.0的点零一定不能少
    endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    // 3.添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor orangeColor] setFill];
    // 4.渲染
    CGContextFillPath(ctx);
    
    // 2.拼接路径
    // 第二个扇形
    startA = endA;
    angle = 25 / 100.0 * M_PI * 2; // 这里100.0的点零一定不能少
    endA = startA + angle;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path1 addLineToPoint:center];
    // 3.添加到上下文
    CGContextAddPath(ctx, path1.CGPath);
    [[UIColor blueColor] setFill];
    // 4.渲染
    CGContextFillPath(ctx);
    
    // 2.拼接路径
    // 第三个扇形
    startA = endA;
    angle = 50 / 100.0 * M_PI * 2; // 这里100.0的点零一定不能少
    endA = startA + angle;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path2 addLineToPoint:center];
    // 3.添加到上下文
    CGContextAddPath(ctx, path2.CGPath);
    [[UIColor redColor] setFill];
    // 4.渲染
    CGContextFillPath(ctx);

}


@end
