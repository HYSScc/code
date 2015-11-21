//
//  View.m
//  08-雪花
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "View.h"
@interface View()
@property (nonatomic, assign) CGFloat snowY; // 记录雪花的Y值的变化
@end

@implementation View

// 加载XIB完毕后就调用
- (void)awakeFromNib
{
    // 定时器
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    // 屏幕刷新的时候就会触发
    // iphone每秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _snowY += 10;
    
    UIImage *image = [UIImage imageNamed:@"雪花"];
    
    [image drawAtPoint:CGPointMake(0, _snowY)]; // 原始大小
}


@end
