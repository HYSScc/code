//
//  View.m
//  06-UIKit演练
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "View.h"

@implementation View


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 画图片 头像
    UIImage *image = [UIImage imageNamed:@"头像"];
    
    [image drawAtPoint:CGPointZero]; // 原始大小
    [image drawInRect:CGRectMake(0, 0, 100, 100)]; // 设置的大小
    
    // 图片 001
    
    // 裁剪 首先设置裁剪区域,超出区域都会被裁剪掉
    UIRectClip(CGRectMake(0, 0, 100, 100));
    
    UIImage *pimage = [UIImage imageNamed:@"001"];
    [pimage drawAsPatternInRect:rect]; // 平铺
    
    
}

#warning 添加文字
- (void)drawText
{
    // 1.添加文字
    NSString *text = @"hello worlddafgahaehaetadgdglasgkas";
    
    CGRect textFrame = CGRectMake(0, 0, 100, 100);
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:20],
                           NSForegroundColorAttributeName : [UIColor redColor]
                           
                           };
    
    /**
     drawInRect: 自动换行
     drawAtPoint: 不会自动换行
     */
    
    UIRectFill(textFrame); // 画矩形，先画得在下面
    
    // 将文字画在矩形里面,字典：里面设置颜色，大小。key怎么找？素材文件中有。
    [text drawInRect:textFrame withAttributes:dict]; // 封转，内部已经获取上下文。只能在drawRect方法中用，因为只有这个方法中，才能获取上下文
    
    //    [text drawAtPoint:CGPointZero withAttributes:dict];
}

@end
