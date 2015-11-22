//
//  UIImage+Tool.m
//  02-图片裁剪
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "UIImage+Tool.h"
#import <UIKit/UIKit.h>

@implementation UIImage (Tool)
+ (instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
{
    // 1.圆环的宽度
    CGFloat borderW = border;
    
    // 2.加载旧图片
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 3.新的图片尺寸
    CGFloat imageW = oldImage.size.width + 2 * borderW;
    CGFloat imageH = oldImage.size.height + 2 * borderW;
    
    // 有时候传入的是长方形，需要判断，裁剪边长短的一边
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    // 4.开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    
    // 5.画圆大圆：正切圆正切与上下文
    // 基本4步骤
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    // 设置颜色
    [color set];
    // 渲染
    CGContextFillPath(ctx);
    
    CGRect cilpR = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
    // 5.画圆
    UIBezierPath *cilpPath = [UIBezierPath bezierPathWithOvalInRect:cilpR];
    // 6.设置裁剪区域
    [cilpPath addClip];
    // 7.画图片,设置开始点
    [oldImage drawAtPoint:CGPointMake(borderW, borderW)];
    // 8.生成一个新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 9.关闭上下文
    UIGraphicsEndImageContext();

    return newImage;
}
@end
