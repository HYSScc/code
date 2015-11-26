//
//  ViewController.m
//  01-图层的基本使用
//
//  Created by tom-pc on 15/11/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // layer形变
//    _imageView.layer.transform = CATransform3DMakeRotation(<#CGFloat angle#>, <#CGFloat x#>, <#CGFloat y#>, <#CGFloat z#>)
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
        // 旋转
//         _imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 1);
        // 平移
//        _imageView.layer.transform = CATransform3DMakeTranslation(100, 200, 0);
        // 缩放
//        _imageView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
        
        // 用KVC来设置旋转
        // key 一定是layer的一些属性  value 一定是layer的属性类型
        // 属性类型CATransform3DMakeRotation(M_PI, 1, 1, 1);
        // value一般传人的是对象，将属性类型包装成对象
//        NSValue *rotation = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//        [_imageView.layer setValue:rotation forKeyPath:@"transform"]; // KVC forKey性能小于forKeyPath
        
        // KVC 二维旋转
        // KVC又封转了一层
//        [_imageView.layer setValue:@M_PI forKeyPath:@"transform.rotation"]; // KVC forKey性能小于forKeyPath
        // 缩放
//        [_imageView.layer setValue:@0.5 forKeyPath:@"transform.scale"];
        
        // 平移
//        [_imageView.layer setValue:[NSValue valueWithCGPoint:CGPointMake(100, 100)] forKeyPath:@"transform.translation"];
        [_imageView.layer setValue:@200 forKeyPath:@"transform.translation"];
    }];
    
}

#warning 设置imageView的layer属性。
- (void)imageLayer
{
    // 图片加在layer上面的contents上；
    _imageView.layer.cornerRadius = 50;
    _imageView.layer.masksToBounds = YES;
    
    _imageView.layer.borderWidth = 3;
    _imageView.layer.borderColor = [UIColor redColor].CGColor;
    
    NSLog(@"%@----%@", _imageView.layer.sublayers, _imageView.layer.contents);
}

#warning 设置View的Layer属性
- (void)viewLayer
{
    _redView.layer.shadowOpacity = 1; // 设置0无透明， 设置1有阴影
    
    _redView.layer.shadowColor = [UIColor purpleColor].CGColor; //默认的是CG框架，需要强转。在color后面写.CGColor。
    //    _redView.layer.shadowOffset; // 偏移量
    _redView.layer.shadowRadius = 10; // 半径,周围都有阴影。
    
    _redView.layer.cornerRadius = 50; // 给图层设置圆角
    
    _redView.layer.borderWidth = 2; // 边宽
    _redView.layer.borderColor = [UIColor whiteColor].CGColor; // 边框颜色
}
@end
