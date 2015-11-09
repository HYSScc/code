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
} xMoving;

#define xMovingPadding 20.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

- (IBAction)move:(UIButton *)button{

    // 修改frame，旋转后，不能实现移动
    CGRect frame = self.iconButton.frame;
    
    switch (button.tag) {
        case xMovingTop:
            frame.origin.y -= xMovingPadding;
            break;
        case xMovingLeft:
            frame.origin.x -= xMovingPadding;
            break;
        case xMovingBottom:
            frame.origin.y += xMovingPadding;
            break;
        case xMovingRight:
            frame.origin.x += xMovingPadding;
            break;
        }
    self.iconButton.frame = frame;
    
    // center修改
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
    CGRect bounds = self.iconButton.bounds;
    
    if (button.tag == 11) {
        NSLog(@"缩小");
        bounds.size.width -= xMovingPadding;
        bounds.size.height -= xMovingPadding;
    }else if (button.tag == 10){
        bounds.size.width += xMovingPadding;
        bounds.size.height += xMovingPadding;
    }
    // 动画
    [UIView animateWithDuration:2.0 animations:^{
        self.iconButton.bounds = bounds;
    }];

}

- (IBAction)rotate:(UIButton *)button{

}

@end
