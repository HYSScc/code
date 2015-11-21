//
//  ShapeView.m
//  02-基本图形绘制-基本形状
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ShapeView.h"

@interface  ShapeView()

@property (nonatomic, weak) UILabel *label;

@end

@implementation ShapeView

- (UILabel *)label
{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 100)]; // 默认Weak类型，这里需要强引用
        label.text = @"s";
        label.font = [UIFont systemFontOfSize:60];
        label.textColor = [UIColor yellowColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (void)awakeFromNib
{
//    self.label;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 四分之一的圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    CGFloat endA = M_PI_2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES]; // 顺时针YES 逆时针NO 圆心 半径 开始的角度 结束的角度
    
    [path addLineToPoint:center]; // 添加一条到圆心的路径
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染到上下文
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx); // 填充
}

#warning 圆弧
- (void)drawArc
{
    // 圆弧
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    CGFloat endA = M_PI;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:NO]; // 顺时针YES 逆时针NO 圆心 半径 开始的角度 结束的角度
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染到上下文
    CGContextStrokePath(ctx);
}

#warning 椭圆
- (void)drawCircle
{
    // 圆形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)]; // 椭圆，当宽和高相同的时候，就是一个圆形
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染到上下文
    CGContextStrokePath(ctx);
}

#warning 矩形的实现
- (void)drawRectangle
{
    // 矩形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 200, 200)]; // 矩形
    path =  [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 200, 200) cornerRadius:20]; // 圆角，当圆角的半径是宽度的一半 就成为一个圆形
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.渲染到上下文
    CGContextStrokePath(ctx);

}



#warning 三角形的实现
- (void)drawSuperman
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint startP = CGPointMake(10, 10);
    
    // 起点
    [path moveToPoint:startP];
    // 终点
    [path addLineToPoint:CGPointMake(125, 125)];
    //
    [path addLineToPoint:CGPointMake(240, 10)];
    // 从路径地终点连接到起点
    //    [path addLineToPoint:startP];
    [path closePath]; // 关闭路径
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor blueColor] setFill]; // 设置填充的颜色
    [[UIColor redColor] setStroke]; // 边线颜色 不显示（设置即填充又描边显示）
    
    CGContextSetLineWidth(ctx, 15); // 边线宽度 不显示（设置即填充又描边显示）
    
    // 4.渲染上下文
    //    CGContextStrokePath(ctx);
    //    CGContextFillPath(ctx); // 填充
    CGContextDrawPath(ctx, kCGPathFillStroke); // 即填充又描边

}

@end
