//
//  MessageFrameModel.m
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MessageFrameModel.h"
#import "Constant.h"
#import "MessageModel.h"
@implementation MessageFrameModel

- (void)setMessageModel:(MessageModel *)messageModel
{
    _messageModel = messageModel; // 一定加上，负责出了setter方法messageModel将为nil；
    
    // 1.时间
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = xScreenWidth;
    CGFloat timeH = xNormalHeight;
    
    _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    
    // 2.头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = xIconWidth;
    CGFloat iconH = xIconHeight;
    
    if (messageModel.type == MessageModelG) {
        // 自己发的消息
        iconX = xScreenWidth - xPadding - xIconWidth;
    } else
    {
        // J发的消息
        iconX = xPadding;
    }
    
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 3.正文
    CGFloat textViewX;
    CGFloat textViewY = CGRectGetMaxY(_timeF);
    
    CGSize textMaxSize = CGSizeMake(150, MAXFLOAT);
    CGSize textRealSize =  [messageModel.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:xBtnFont} context:nil].size;
    
    if (messageModel == MessageModelG) {
        textViewX = xScreenWidth - xIconWidth - xPadding - textMaxSize.width;
    } else
    {
        textViewX = xPadding + xIconWidth;
    }
    
//    _textViewF = CGRectMake(textViewX, textViewY, <#CGFloat width#>, <#CGFloat height#>)
    _textViewF = (CGRect){{textViewX,textViewY},textRealSize}; // 取得RealSize就省去textViewW和textViewH；
    
    // 4.cellHeight
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textViewF);
    
    _cellHeight = MAX(iconMaxY, textMaxY);
    
}

+ (NSMutableArray *)messageFrameModel
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        MessageModel *messageModel = [MessageModel messageModelWithDict:dict];
        
        MessageFrameModel *messageFrameModel = [[MessageFrameModel alloc] init];
        
        messageFrameModel.messageModel = messageModel;
        
        [arrayM addObject:messageFrameModel];
        
    }
    return arrayM;
}


@end
