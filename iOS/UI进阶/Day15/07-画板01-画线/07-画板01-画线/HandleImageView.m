//
//  HandleImageView.m
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "HandleImageView.h"
#import "UIImage+Tool.h"

@interface HandleImageView()<UIGestureRecognizerDelegate>
@property (nonatomic ,weak) UIImageView *imageView;
@end

@implementation HandleImageView

- (void)addImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageView.userInteractionEnabled = YES; // 添加 与用户交互
    
    _imageView = imageView; // 添加 创建完之后赋值
    [self addSubview:imageView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加UIImageView
        [self addImageView];
        
        // 添加手势
        [self addGestureRecognizers];
    }
    return self;
}
// imageSetter方法
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    _imageView.image = image;
}

// 手势方法
- (void)addGestureRecognizers
{
    // 1.长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    // 给imageView添加手势
    [_imageView addGestureRecognizer:longPress];
    
    // 2.旋转
    [self rotation];
    
    // 3.缩放
    [self pinch];
}
// 默认调用两次
- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.5 animations:^{
            _imageView.alpha = 0.0; // 全白
        }completion:^(BOOL finished) {
            
                [UIView animateWithDuration:0.5 animations:^{
                    _imageView.alpha = 1; // 全透
                }completion:^(BOOL finished) {
                    
                    // 1.截屏
                    UIImage *newImage = [UIImage imageWithcaptureView:self]; // 截屏解的是self
                    // 2.把图片传给控制器
                    _block(newImage);
                    // 3.把自己移除父控件
                    [self removeFromSuperview];
                }];
            
        }];
    }
}

#warning 手势
- (void)rotation
{
    // 旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    
    [_imageView addGestureRecognizer:rotation];
}
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
    
    // 复位
    rotation.rotation = 0;
}

- (void)pinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    
    [_imageView addGestureRecognizer:pinch];
}
- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    
    // 复位
    pinch.scale = 1;
}

#warning 手势代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
