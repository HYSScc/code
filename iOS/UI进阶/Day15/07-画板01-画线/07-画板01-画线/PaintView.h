//
//  PaintView.h
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;

- (void)clearScreen;
- (void)undo;
@end
