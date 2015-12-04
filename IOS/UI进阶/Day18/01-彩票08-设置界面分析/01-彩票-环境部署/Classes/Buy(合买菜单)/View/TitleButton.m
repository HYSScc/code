//
//  TitleButton.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "TitleButton.h"

#import <Availability.h>

#define iOSVersion [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

@implementation TitleButton
// 改变title的位置
// 不能使用self.titleLabel 因为self.titleLabel内部会调用titleRectForContentRect:
// iOS6 中没有boundingRectWithSize: 这个方法
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat tilteY = 0;
    CGFloat titleW = 0;
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:15.0]
                           };
    
//    CGFloat titleW = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
    if (iOSVersion) { // 判断运行时
#ifdef __IPHONE_7_0 // 判断编译时 sdk 7.0才允许编译
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
#endif // sdk 6.0 编译下面
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:15.0]].width;
        
    }else{
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:15.0]].width;
    }
    
    CGFloat titleH = contentRect.size.height; // contentRect就是按钮的尺寸
    
    return CGRectMake(titleX, tilteY, titleW, titleH);
}
// 改变image的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
// XIB结束后调用
- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeCenter; // 设置居中
}

@end
