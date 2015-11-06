//
//  FooterView.m
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "FooterView.h"

@interface FooterView ()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *tipsView;

@end

@implementation FooterView

- (IBAction)loadMore {
    
    NSLog(@"%s", __func__);
    
    // 隐藏按钮
    self.loadMoreButton.hidden = YES;
    // 显示提示视图
    self.tipsView.hidden = NO;

    [self.delegate footerViewDidLoadButtonClick:self];
    
    // 延时的块代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       self.loadMoreButton.hidden = NO;
                       self.tipsView.hidden = YES;
                   });
    
}

+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
}

@end
