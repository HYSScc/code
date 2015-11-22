//
//  ViewController.m
//  03-屏幕截屏
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageWithcaptureView:self.view];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/tom/Desktop/image.png" atomically:YES];
}
// 截屏
- (void)captureView
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.渲染控制器View的图层到上下文(图层只能用渲染不能用Draw)
    [self.view.layer renderInContext:ctx];
    
    // 3.获取截屏图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/tom/Desktop/newImage1.png" atomically:YES];
}
@end
