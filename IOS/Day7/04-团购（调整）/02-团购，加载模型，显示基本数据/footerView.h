//
//  footerView.h
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class footerView;
@protocol footerViewDelegate <NSObject>

@optional
// 视图的下载按钮被点击
- (void)footerViewDidDownloadButtonClick:(footerView *)footerView;

@end

@interface footerView : UIView

// 代理如果使用强引用，就会产生循环引用 造成控制器和子视图都无法被释放，造成内存泄露
@property (nonatomic, weak) id <footerViewDelegate> delegate;

+ (instancetype)footView;

// 刷新数据结束后，更新页脚的视图显示
- (void)endRefresh;
@end
