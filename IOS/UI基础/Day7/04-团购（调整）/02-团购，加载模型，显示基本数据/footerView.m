//
//  footerView.m
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "footerView.h"

@interface footerView()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *tipsView;
@end

@implementation footerView

- (IBAction)loadMore {
    
    NSLog(@"%s", __func__);
    // 1.隐藏按钮
    self.loadMoreButton.hidden = YES;
    // 2.显示提示视图
    self.tipsView.hidden = NO;
    
    // 3.加载数据（从网络服务器加载，需要时间）
    // view是用来显示数据的,用代理来实现加载数据
    // 代理是用来监听的，发生某些事情的时候，通知“代理”-> 控制器去“工作”-> 加载数据
    //        [self.delegate footerViewDidDownloadButtonClick:self];
    // 3.1 判断代理是否实现协议的方法
    if ([self.delegate respondsToSelector:@selector(footerViewDidDownloadButtonClick:)]) {
        [self.delegate footerViewDidDownloadButtonClick:self];
    }
    
    // 延时执行命令，多线程GCD
    // 今后关于延时的操作，统一使用dispatch_after
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 块代码中的代码会在2.0秒之后执行
//        
//    });
    
    
}

// 视图控制器刷新完成调用方法
- (void)endRefresh
{
    // 4.加载完成数据
    self.loadMoreButton.hidden = NO;
    self.tipsView.hidden = YES;
}

+ (instancetype)footView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"footerView" owner:nil options:nil] lastObject];
}
@end
