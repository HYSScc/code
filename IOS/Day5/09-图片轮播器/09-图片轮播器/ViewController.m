//
//  ViewController.m
//  09-图片轮播器
//
//  Created by tom-pc on 15/10/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#define kImageCount     5

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
        
        // 取消弹簧效果
        _scrollView.bounces = NO;
        
        // 取消水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        // 要分页
        _scrollView.pagingEnabled = YES;
        
        // contentSize设置了，视图才能滚动
        self.scrollView.contentSize = CGSizeMake(kImageCount * _scrollView.bounds.size.width, 0);
        
        // 设置代理
        _scrollView.delegate = self;
    }
    return  _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        // 分页控件,本质上和scrollView没有任何关系，是两个独立的控件
        _pageControl = [[UIPageControl alloc] init];
        // 总页数
        _pageControl.numberOfPages = kImageCount;
        // 控件尺寸
        CGSize size = [_pageControl sizeForNumberOfPages:kImageCount];
        
        // 设置位置
        // 大小
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        // x，y
        _pageControl.center = CGPointMake(self.view.center.x, 150); // 分页控件的位置是加在View上的，而不是scrollView上
        
        [self.view addSubview:_pageControl];
        
        // 设置颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        
        // 添加监听方法
        /** 在OC中，绝大多数“控件”，都可以监听UIControlEventValueChaned事件，button除外 */
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageControl;
}

// 分页控件的监听方法
- (void)pageChanged:(UIPageControl *)page
{
    NSLog(@"%ld", page.currentPage);
    
    // 根据页数，调整滚动视图中的图片位置contentOffset
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

// 视图加载完成调用，通常用来设置数据
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 设置图片
    for (int i = 0; i<kImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        // 建立图像视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        // 设置图像
        imageView.image = image;
        
        // 将图像视图加到滚动视图上
        [self.scrollView addSubview:imageView];
        
    }
    
    // 计算imageView的位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        // 调整x -> origin -> frame
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
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer
{
//    NSLog(@"%ld", self.pageControl.currentPage);
    // 页号发生变化
    // （当前的页数 + 1） % 总页数
    int page = (self.pageControl.currentPage + 1) % kImageCount;
    self.pageControl.currentPage = page;
    
    NSLog(@"%ld", self.pageControl.currentPage);
    // 调用监听方法，让滚动视图滚动
    [self pageChanged:self.pageControl];

}

#pragma mark - ScrollView的代理方法
// 滚动视图停下来，修改页面控件的小点（页数）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    // 停下来的当前页数
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    // 计算页数
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = page;
}


@end
