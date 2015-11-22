//
//  UIImage+Tool.h
//  02-图片裁剪
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)
/**
    生成一个带圆环的图片
 
    name 图片的名称
    border 圆环宽度
    color 圆环颜色
 */
+ (instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;

/**
    截屏
    
    view 需要截屏的视图
 */
+ (instancetype)imageWithcaptureView:(UIView *)view;
@end
