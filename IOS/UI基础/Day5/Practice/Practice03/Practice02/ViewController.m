//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end

@implementation ViewController

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
    [self.imageView sizeToFit];
    
    self.scrollView.contentSize = image.size;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image = [UIImage imageNamed:@"minio"];
    
    // 设置边距
    self.scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    // 不显示水平滚动标示
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 不显示垂直滚动标示
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // 偏移位置 (初始显示的位置)
    self.scrollView.contentOffset = CGPointMake(400, 400);
    
    // 取消弹簧效果
//    self.scrollView.bounces = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click
{
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 20;
    offset.y += 20;
    // 设置contentOffset会忽略contentSize
    self.scrollView.contentOffset = offset;
}


@end
