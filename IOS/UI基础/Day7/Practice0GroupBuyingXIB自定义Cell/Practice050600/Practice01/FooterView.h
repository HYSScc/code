//
//  FooterView.h
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
@protocol FooterViewDelegate <NSObject>

// 视图的下载按钮被点击
- (void)footerViewDidLoadButtonClick:(FooterView *)footerView;

@end

@interface FooterView : UIView

@property (nonatomic, weak) id<FooterViewDelegate> delegate;

+ (instancetype)footerView;
@end
