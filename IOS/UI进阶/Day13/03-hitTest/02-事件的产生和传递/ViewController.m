//
//  ViewController.m
//  02-事件的产生和传递
//
//  Created by tom-pc on 15/11/17.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

/**
    UIApplication -> UIWindow
 
    // 什么时候调用：当事件传递给一个控件的时候就会调用
    作用：找最合适的view
 
    hitTest:withEvent: return (UIView *)
    1.看窗口是否能接收事件。如果不能 return nil； 自己不能接收事件，也不能处理事件，而且也不能把事件传递给子控件
    2.判断点在不在窗口上，如果点在窗口上，意味着窗口满足合适的view
    3.白色的view hitTest:withEvent: return (nil)
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[UIApplication sharedApplication].keyWindow hitTest:<#(CGPoint)#> withEvent:<#(nullable UIEvent *)#>];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
