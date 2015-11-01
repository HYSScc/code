//
//  UIImage+Resizeimage.m
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "UIImage+Resizeimage.h"

@implementation UIImage (Resizeimage)
+ (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat w = normal.size.width * 0.5f;
    CGFloat h = normal.size.height * 0.5f;
    
    // 传人上、下、左、右不需要拉伸的边距，只拉升中间部分
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
    
    // 传人上、下、左、右不需要拉伸的边距，只拉升中间部分，并且传人模式(平铺/拉伸)
    //    [normal : resizingMode:];
    // 只用传人左边和顶部不需要拉伸的位置，系统会算出右边和底部不需要拉伸的位置。并且中间有1*1的点用于拉伸或者平铺
    //    [normal stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>];
}
@end
