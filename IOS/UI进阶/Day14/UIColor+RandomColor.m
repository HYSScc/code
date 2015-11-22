//
//  UIColor+RandomColor.m
//  05-柱状图
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+ (UIColor *)randomColor
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

@end
