//
//  MessageModel.h
//  01-QQ聊天界面
//
//  Created by tom-pc on 15/10/27.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    MessageModelG = 0,
    MessageModelJ
} MessageModelType;

@interface MessageModel : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) MessageModelType type;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageModelWithDict:(NSDictionary *)dict;
@end