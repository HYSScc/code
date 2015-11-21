//
//  BaseView.m
//  02-事件的产生和传递
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
// 获取当前方法在哪个类里面调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__); // 无论点击哪个屏幕，打印出来的都是baseView
    NSLog(@"%@", [self class]); // 谁调用打印谁的类名
}

@end
