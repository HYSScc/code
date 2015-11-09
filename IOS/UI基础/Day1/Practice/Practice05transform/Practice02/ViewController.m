//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    xMovingTop = 2,
    xMovingLeft,
    xMovingBottom,
    xMovingRight,
    xMovingB,
    xMovingS,
    xMovingL,
    xMovingR,
} xMoving;

#define xMovingPadding 20.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@property (nonatomic, assign) CGFloat delta;
@end

@implementation ViewController

- (IBAction)move:(UIButton *)button{

    // 修改frame，旋转后，不能实现移动
//    CGRect frame = self.iconButton.frame;
//    
//    switch (button.tag) {
//        case xMovingTop:
//            frame.origin.y -= xMovingPadding;
//            break;
//        case xMovingLeft:
//            frame.origin.x -= xMovingPadding;
//            break;
//        case xMovingBottom:
//            frame.origin.y += xMovingPadding;
//            break;
//        case xMovingRight:
//            frame.origin.x += xMovingPadding;
//            break;
//        }
//    self.iconButton.frame = frame;
    
    
    // center修改,旋转后，移动是按view的方向
//    CGPoint center = self.iconButton.center;
//    
//    switch (button.tag) {
//        case xMovingTop:
//            center.y -= xMovingPadding;
//            break;
//        case xMovingLeft:
//            center.x -= xMovingPadding;
//            break;
//        case xMovingBottom:
//            center.y += xMovingPadding;
//            break;
//        case xMovingRight:
//            center.x += xMovingPadding;
//            break;
//    }
//    self.iconButton.center = center;
    

    // transform，旋转后，移动是按iconView自身的方向
    
    CGFloat dx = 0, dy = 0;
    
    if (button.tag == xMovingTop || button.tag == xMovingBottom) {
        dy = (button.tag == xMovingTop) ? -xMovingPadding : xMovingPadding;
    }
    if (button.tag == xMovingLeft || button.tag == xMovingRight) {
        dx = (button.tag == xMovingLeft) ? -xMovingPadding : xMovingPadding;
    }
    
    self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, dx, dy);
    
    
}

- (IBAction)zoom:(UIButton *)button{
    
    // 修改frame,效果是根据左上角点，然后放大
//    CGRect frame = self.iconButton.frame;
//    
//    if (button.tag == 11) {
//        NSLog(@"缩小");
//        frame.size.width -= xMovingPadding;
//        frame.size.height -= xMovingPadding;
//    }else if (button.tag == 10){
//        frame.size.width += xMovingPadding;
//        frame.size.height += xMovingPadding;
//    }
//    self.iconButton.frame = frame;
    
    
    // 修改bounds，效果是根据中心点，然后放大
//    CGRect bounds = self.iconButton.bounds;
//    
//    if (button.tag == 11) {
//        NSLog(@"缩小");
//        bounds.size.width -= xMovingPadding;
//        bounds.size.height -= xMovingPadding;
//    }else if (button.tag == 10){
//        bounds.size.width += xMovingPadding;
//        bounds.size.height += xMovingPadding;
//    }
//    // 动画
//    [UIView animateWithDuration:2.0 animations:^{
//        self.iconButton.bounds = bounds;
//    }];

    
    // transform,效果是根据中心点，然后放大
    CGFloat scale = 0;
    if (button.tag == xMovingB || button.tag == xMovingS) {
        scale = (button.tag == xMovingB) ? 1.2 : 0.8;
    }
    self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, scale, scale);
}

- (IBAction)rotate:(UIButton *)button{
    CGFloat angle = 0;
    if (button.tag == xMovingL || button.tag == xMovingR) {
        angle = (button.tag == xMovingL) ? -M_PI_4 : M_PI_4;
    }
    self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, angle);
}

@end
