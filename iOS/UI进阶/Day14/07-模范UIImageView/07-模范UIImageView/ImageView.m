//
//  ImageView.m
//  07-模范UIImageView
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //
    [_image drawInRect:rect];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay]; // 重绘
}

@end
