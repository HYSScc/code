//
//  WheelView.h
//  12-转盘
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WheelView : UIView
+ (instancetype)wheelView;

// 开始旋转
- (void)startRotating;

// 停止旋转
- (void)stopRotating;
@end
