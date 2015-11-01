//
//  MessageFrameModel.h
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/29.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class MessageModel;
@interface MessageFrameModel : NSObject
@property (nonatomic, assign, readonly) CGRect timeF;
@property (nonatomic, assign, readonly) CGRect textViewF;
@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGFloat cellHeight;
// 数据模型
@property (nonatomic, strong) MessageModel *messageModel;

+ (NSMutableArray *)messageFrameModel;
@end
