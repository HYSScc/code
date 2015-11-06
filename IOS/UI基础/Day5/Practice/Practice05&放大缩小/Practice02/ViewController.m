//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
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

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        
        // 设置边距
        _scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        // 不显示水平滚动标示
        _scrollView.showsHorizontalScrollIndicator = NO;
        // 不显示垂直滚动标示
        _scrollView.showsVerticalScrollIndicator = NO;
        
        // 偏移位置 (初始显示的位置)
        _scrollView.contentOffset = CGPointMake(400, 400);
        
        // 取消弹簧效果
        //    self.scrollView.bounces = NO;
        
        _scrollView.delegate = self;
        
        _scrollView.maximumZoomScale = 2.0;
        _scrollView.minimumZoomScale = 0.2;
        
        [self.view addSubview:_scrollView];

    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image = [UIImage imageNamed:@"minio"];
    
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

#pragma mark - 代理方法
// 告诉scrollView要缩放的视图是谁，具体的缩放实现，是由scrollView来完成的
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

// 滚动视图即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"%s", __func__);
}

// 滚动视图完成缩放
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%s", __func__);
}

// 正在缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}


@end
