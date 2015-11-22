//
//  BarView.m
//  05-柱状图
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "BarView.h"
#import "UIColor+RandomColor.h"

@implementation BarView

//- (UIColor *)randomColor
//{
//    /**
//     颜色有两种表现形式 RGB RGA
//     RGB 24
//     R,G,B每个颜色通道8位
//     8的二进制取值范围 255
//     R,G,B每个颜色取值 0 ~ 255
//     
//     120 / 255.0
//     */
//    CGFloat r = arc4random_uniform(256) / 255.0;
//    CGFloat g = arc4random_uniform(256) / 255.0;
//    CGFloat b = arc4random_uniform(256) / 255.0;
//    
//    return [UIColor colorWithRed:r green:g blue:b alpha:1];
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    NSArray *data = @[@20, @30, @50];
    NSInteger count = data.count;
    
    // 2.拼接路径
    CGFloat w = rect.size.width / (2 * count - 1);
    CGFloat h = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat viewH = rect.size.height;
    
    for (int i = 0; i < count; i++) {
        
        // 2.拼接路径
        h = viewH * [data[i] intValue] / 100.0;
        x = 2 * w * i;
        y = viewH - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        // 3.添加路径到上下文
        CGContextAddPath(ctx, path.CGPath);
        [[UIColor randomColor] setFill];
        
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


@end
