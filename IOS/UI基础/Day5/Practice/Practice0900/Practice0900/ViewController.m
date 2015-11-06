//
//  ViewController.m
//  Practice0900
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#define xImageCount 5

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 355, 150)];
        _scrollView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_scrollView];
        
        // 设置size才能滚动
        self.scrollView.contentSize = CGSizeMake(xImageCount * _scrollView.bounds.size.width, 0);
        
        // 要分页
        _scrollView.pagingEnabled = YES;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.bounces = NO;
        
        _scrollView.delegate = self;
    }
    return _scrollView;
}

// 分页控件
- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        
        // 分页控件，本质上和ScrollView没有任何关系
        
        // 总页数
        _pageControl.numberOfPages = xImageCount;
        
        // 控件尺寸
        CGSize size = [_pageControl sizeForNumberOfPages:xImageCount];
        
        // 设置位置
        // 大小
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        // x y
        _pageControl.center = CGPointMake(self.view.center.x, 150); // 分页控件的位置是加在view上的，而不是scrollView上
        [self.view addSubview:_pageControl];
        
        // 颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

// page的监听方法
- (void)pageChanged:(UIPageControl *)page
{
    NSLog(@"%ld", page.currentPage); // 点击后，打印出的是页数
    
    // 根据页数，调整滚动视图中图片的contentOffset
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置图片
    for (int i = 0; i < xImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        // 建立图像视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        // 设置图像
        imageView.image = image;
        
        // 添加到视图
        [self.scrollView addSubview:imageView];
    }
    
    // 计算UIImageView的位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * stop) {
        
        CGRect frame = imageView.frame;
        frame.origin.x = idx * frame.size.width;
        
        imageView.frame = frame;
    }];
    NSLog(@"%@", self.scrollView.subviews);
    
    // 分页初始页数为0
    self.pageControl.currentPage = 0;
    
    // 启动时钟
    [self startTimer];
    
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    NSLog(@"%ld", self.pageControl.currentPage);
    
    int page = (self.pageControl.currentPage + 1) % xImageCount;
    self.pageControl.currentPage = page;
    
    NSLog(@"%ld", self.pageControl.currentPage);
    
    [self pageChanged:self.pageControl];
}

#pragma mark - ScrollView代理方法
// 滚动视图停下来，修改页面控件的小点
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    // 停下来的当前页数
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = page;
}

// 抓住时，会调用此方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    // 时钟停止，停止后需要重新实例化
    [self.timer invalidate];
}

// 送开图片时，会调用此方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s", __func__);
    
    // 重新开启时钟
    [self startTimer];
}
@end
