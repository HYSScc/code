//
//  HandleImageView.h
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^HandleImageViewBlock) (UIImage *image);

@interface HandleImageView : UIView
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) HandleImageViewBlock block;
@end
