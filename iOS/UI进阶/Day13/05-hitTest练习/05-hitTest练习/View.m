//
//  View.m
//  05-hitTest练习
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "View.h"

@implementation View

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 把自己的点转换按钮的坐标系上的点
//    CGPoint buttonPoint = [self convertPoint:point toView:_button];
//    
//    if ([_button pointInside:buttonPoint withEvent:event]) {
//        return nil;
//    }
//    return [super hitTest:point withEvent:event];
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint buttonPoint = [self convertPoint:point toView:_button];
    
    if ([_button pointInside:buttonPoint withEvent:event]) {
        return NO;
    }
    
    return [super pointInside:point withEvent:event];
}

@end
