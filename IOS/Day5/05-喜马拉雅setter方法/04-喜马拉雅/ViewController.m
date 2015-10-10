//
//  ViewController.m
//  04-喜马拉雅
//
//  Created by tom-pc on 15/10/7.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *lastButton;
@end

@implementation ViewController
/**
 setter方法
 
 
 contentSize  会很据边距调整offset
 contentInset 不会调整offset
 */

// 系统加载了Main.storyboard后，给scrollView对象进行赋值
// setScrollView是由系统自动调用的

- (void)setScrollView:(UIScrollView *)scrollView
{
    // setter方法中，第一句赋值
    _scrollView = scrollView;
    
    // 设置边距
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    
    // 设置滚动视图内容
    // 1> 如果当前有间距，根据间距自动调整contentOffset
    // 2> 如果没有间距，contentOffset是(0,0)
    CGFloat h = CGRectGetMaxY(self.lastButton.frame) +   10;
    self.scrollView.contentSize = CGSizeMake(0, h);
    
    NSLog(@"%s", __func__);
    
}

// 视图加载完成之后执行的
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 设置间距
    // 只是指定内容外侧边距，并不会根据contentSize自动调整contentOffset
//    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    // 修改间距
//    self.scrollView.contentOffset = CGPointMake(0, -64); // 因为scrollView设置了64的间距，所以原点的位置改变。(0,64)->(0,0)，设置间距是变成-64。
    NSLog(@"%s", __func__);
}


@end
