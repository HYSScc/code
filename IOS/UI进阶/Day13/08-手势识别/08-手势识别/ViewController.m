//
//  ViewController.m
//  08-手势识别
//
//  Created by tom-pc on 15/11/19.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 平移
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_imageView addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手指移动的位置
    CGPoint trans = [pan translationInView:_imageView]; // 基于开始的位置
    
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, trans.x, trans.y); // 基于上一次的位置
    // 复位
    [pan setTranslation:CGPointZero inView:_imageView];
    
    NSLog(@"%@", NSStringFromCGPoint(trans));
}


#warning 缩放
- (void)pinch
{
    // 缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [_imageView addGestureRecognizer:pinch];
    
    // 旋转
    [self rotation];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch
{   // 缩放
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    
    // 复位
    pinch.scale = 1;
}

// Simultaneous同时
// 默认是不支持多个手势，
// 当你使用一个手势的时候就会调用下面方法。
// 想要实现多个手势，就要遵守协议，实现协议。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


#warning rotato旋转
- (void)rotation
{
    // 旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [_imageView addGestureRecognizer:rotation];
}
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    //    _imageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
    // 复位
    rotation.rotation = 0;
}


#warning swipe
- (void)swipe
{
    // 轻扫(默认向右轻扫)
    // 一个手势只能识别一个方向
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight; // 向右轻扫
    [_imageView addGestureRecognizer:swipe];

}
- (void)swipe:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"swipe");
}



#warning longPress
- (void)addLongPress
{
    // longPress长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [_imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longPress");
    }
}


#warning tap
- (void)addtap
{
    // tap点按
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    // 点按几下才能触发手势
    //    tap.numberOfTapsRequired = 2;
    //    // 必须需要两个手指同时点按才能触发手势
    //    tap.numberOfTouchesRequired = 2;
    
    tap.delegate = self;
    
    [_imageView addGestureRecognizer:tap];
}


- (void)tap:(UITapGestureRecognizer *)tap
{
    NSLog(@"tap");
}

#pragma mark - 代理方法
// 这个触摸点能否触发手势
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    // 这个方法实现图片的一半点击能响应，一半则不能
//    CGPoint currentPoint = [touch locationInView:_imageView];
//    
//    if (currentPoint.x < _imageView.frame.size.width * 0.5) {
//        return NO;
//    }
//    return YES;
//}

@end
