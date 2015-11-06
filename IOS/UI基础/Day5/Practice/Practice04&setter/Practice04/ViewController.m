//
//  ViewController.m
//  Practice04
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *lastButton;
@end

@implementation ViewController

- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    
    
    // 设置初始间距
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    
    
    // 设置滚动内容
    // 如果当前设置了间距，contentSize会自动调整contentOffset，如果没有设置间距，contentOffset默认是(0, 0)
    CGFloat h = CGRectGetMaxY(self.lastButton.frame) + 10;
    self.scrollView.contentSize = CGSizeMake(0, h);
    
    
    // 偏移位置（初始位置）
//    self.scrollView.contentOffset = CGPointMake(0, -64);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
