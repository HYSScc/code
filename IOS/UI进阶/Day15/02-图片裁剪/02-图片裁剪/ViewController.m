//
//  ViewController.m
//  02-图片裁剪
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView.image = [UIImage imageWithName:@"阿狸头像" border:3 borderColor:[UIColor redColor]];
}
- (void)clipCircle
{
    // 1.圆环的宽度
    CGFloat borderW = 3;
    
    // 2.加载旧图片
    UIImage *oldImage = [UIImage imageNamed:@"阿狸头像"];
    
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
    [[UIColor whiteColor] set];
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
    // 10.显示图片
    _imageView.image = newImage;

}

- (void)clip
{
    // 1.加载旧的图片
    UIImage *oldImage = [UIImage imageNamed:@"阿狸头像"];
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    // 3.画圆：正切圆正切与上下文
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    // 4.把圆设为裁剪区
    [path addClip];
    // 5.画图片
    [oldImage drawAtPoint:CGPointZero];
    // 6.生成一个新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 7.关闭上下文
    UIGraphicsEndImageContext();
    // 8.显示图片
    _imageView.image = newImage;
}
@end
