//
//  KeyboardTool.m
//  作业-键盘处理
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "KeyboardTool.h"

@interface KeyboardTool()
- (IBAction)previous:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)down:(id)sender;

@end

@implementation KeyboardTool
// 上一个
- (IBAction)previous:(id)sender {
    // 判断代理有没有实现相应地方法
    if ([self.delegate respondsToSelector:@selector(keyboardTool:didClickItemType:)]) {
        [self.delegate keyboardTool:self didClickItemType:KeyboardItemTypePrevious];
    }
    
}
// 下一个
- (IBAction)next:(id)sender {
    // 判断代理有没有实现相应地方法
    if ([self.delegate respondsToSelector:@selector(keyboardTool:didClickItemType:)]) {
        [self.delegate keyboardTool:self didClickItemType:KeyboardItemTypeNext];
    }
}
// 完成
- (IBAction)down:(id)sender {
    // 判断代理有没有实现相应地方法
    if ([self.delegate respondsToSelector:@selector(keyboardTool:didClickItemType:)]) {
        [self.delegate keyboardTool:self didClickItemType:KeyboardItemTypeDone];
    }
}

+ (instancetype)keyboardTool
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KeyboardTool" owner:nil options:nil] lastObject];
}
@end
