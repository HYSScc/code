//
//  MessageFrameModel.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageFrameModel.h"
#import "UIKit/UIKit.h"
#import "MessageModel.h"
#import "Constant.h"
@implementation MessageFrameModel
- (void)setMessageModel:(MessageModel *)messageModel
{
    _messageModel = messageModel;
    
    // 1.时间
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = xScreenWidth;
    CGFloat timeH = xNormalHeight;
    self.timeF = CGRectMake(timeX, timeY, timeW, timeH);
    
    // 2.头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = xIconWidth;
    CGFloat iconH= xIconHeight;
    
    if (messageModel.type == MessageModelG) {
        // 自己发送的消息
        iconX = xScreenWidth - xPadding - xIconHeight;
    } else
    {   // J发送的消息
        iconX = xPadding;
    }
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 3.正文
    CGFloat textViewBtnX;
    CGFloat textViewBtnY = CGRectGetMaxY(_timeF);
    CGSize textViewBtnMaxSize = CGSizeMake(150, MAXFLOAT);
    CGSize textViewBtnRealSize = [messageModel.text boundingRectWithSize:textViewBtnMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:xBtnFont} context:nil].size;
    if (messageModel.type == MessageModelG) {
        textViewBtnX = xScreenWidth - xIconWidth - xPadding - textViewBtnMaxSize.width;
    }else
    {
        textViewBtnX = xPadding + xIconWidth;
    }
    self.textViewBtnF = (CGRect){{textViewBtnX, textViewBtnY}, textViewBtnRealSize};
    
    // 4.cellHeight
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textViewBtnF);
    self.cellHeight = MAX(iconMaxY, textMaxY);
}

+ (NSMutableArray *)messageFrameModel
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]]; // 拿到数据
    NSMutableArray *arrayM = [NSMutableArray array]; // 创建可变数组
    //从plist文件的数组中，拿出每一个字典进行循环 KVC 赋值，并且放入到一个新的可变数组中，然后返回
    for (NSDictionary *dict in array) {
        
        // 实例化messageFrameModel。
        MessageFrameModel *mfm = [[MessageFrameModel alloc] init];
        // 实例化messageModel并且传人字典KVC，进行循环
        MessageModel *mm = [MessageModel messageModelWithDict:dict];
        // 将实例化的messageModel传给messageFrameModel中的messageModel
        mfm.messageModel = mm;
        
        [arrayM addObject:mfm];
        
    }
    return arrayM;
}

@end
