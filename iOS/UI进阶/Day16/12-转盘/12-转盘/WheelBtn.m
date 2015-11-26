//
//  WheelBtn.m
//  12-转盘
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "WheelBtn.h"

@implementation WheelBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (void)setHighlighted:(BOOL)highlighted
{
    // 重写 不调用父类的 这样就干掉父类的方法
//    [super setHighlighted:highlighted];
}
@end
