//
//  UIImage+Tool.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)imageWithResizableImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    return image;
}

@end
