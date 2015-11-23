//
//  PaintPath.m
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "PaintPath.h"

@implementation PaintPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)startP
{
    PaintPath *path = [[self alloc] init];
    path.lineWidth = width;// 添加设置线宽，在开始的时候设置。
    path.color = color;
    [path moveToPoint:startP]; // 确定起点
    
    return path;
}


@end
