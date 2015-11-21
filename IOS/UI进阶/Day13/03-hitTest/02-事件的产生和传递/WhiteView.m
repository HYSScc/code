//
//  WhiteView.m
//  02-事件的产生和传递
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

// 什么时候调用：当事件传递给一个控件的时候就会调用
// 作用：找最合适的view
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 寻找最合适的View
    // (super调用的父类方法就是BaseView，BaseView默认没有实现hitTest方法，再去UIView中找，系统默认实现，调用的是UIView方法，系统默认的方法)
    UIView *fitView = [super hitTest:point withEvent:event];
//    NSLog(@"%@", fitView);
    return self.subviews[1];
}


@end
