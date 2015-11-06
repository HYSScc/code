//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (nonatomic, strong) UIButton *cover;
@property (nonatomic, strong) NSArray *questionModelList;
@end

@implementation ViewController

// 调整状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIButton *)cover
{
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:_cover];
        
        [_cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
        
        // 添加，动画会从0.0 -> 0.5 -> 1.0 而不是开始动画直接 从0.5 -> 1.0
        _cover.alpha = 0.0; // 透明
    }
    return _cover;
}

- (NSArray *)questionModelList
{
    if (_questionModelList == nil) {
        _questionModelList = [Question questionModel];
    }
    return _questionModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.questionModelList);
}
- (IBAction)bigImage {
    
    NSLog(@"%s", __func__);
    
    // 如果没有放大就缩小，通过cover的alpha判断
    if (self.cover.alpha == 0.0) {
        // 1.添加遮罩
        [self cover];
        
        // 2.将图像按钮前置
        // bringSubviewToFont将子视图前置
        [self.view bringSubviewToFront:self.iconButton];
        
        // 3.动画放大图像按钮
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat x = 0;
        CGFloat y = (self.view.bounds.size.height - h) * 0.5 - 21;
        
        // 添加动画(点击按钮后，伴随动画图片放大到指定位置，关键：取消了storyboard中控制器中的一个 use auto layout的选项)
        [UIView animateWithDuration:2.0f animations:^{
            self.iconButton.frame = CGRectMake(x, y, w, h);
            self.cover.alpha = 1.0;
        }];

    } else {
        // 4.缩小iconButton
        [UIView animateWithDuration:2.0f animations:^{
            self.iconButton.frame = CGRectMake(110, 110, 150, 150);
            self.cover.alpha = 0.0;
        }];
    }
}
@end
