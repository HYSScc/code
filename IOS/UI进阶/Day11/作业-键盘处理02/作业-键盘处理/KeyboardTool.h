//
//  KeyboardTool.h
//  作业-键盘处理
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeyboardTool;
typedef enum {
    KeyboardItemTypePrevious, // 上一个
    KeyboardItemTypeNext, // 下一个
    KeyboardItemTypeDone // 完成
}KeyboardItemType;

@protocol KeyboardToolDelegate <NSObject>

- (void)keyboardTool:(KeyboardTool *)keyboardTool didClickItemType:(KeyboardItemType)itemType;

@end

@interface KeyboardTool : UIView
+ (instancetype)keyboardTool;

// 添加代理
@property (nonatomic, weak) id<KeyboardToolDelegate> delegate;
@end
