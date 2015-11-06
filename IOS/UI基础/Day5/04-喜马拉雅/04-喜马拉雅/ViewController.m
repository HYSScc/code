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
 contentSize  会很据边距调整offset
 contentInset 不会调整offset
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置滚动视图内容
    // 1> 如果当前有间距，根据间距自动调整contentOffset
    // 2> 如果没有间距，contentOffset是(0,0)
    CGFloat h = CGRectGetMaxY(self.lastButton.frame) +   10;
    self.scrollView.contentSize = CGSizeMake(0, h);
    
    // 设置间距
    // 只是指定内容外侧边距，并不会根据contentSize自动调整contentOffset
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    // 修改间距
    self.scrollView.contentOffset = CGPointMake(0, -64); // 因为scrollView设置了64的间距，所以原点的位置改变。(0,64)->(0,0)，设置间距是变成-64。
}


@end
