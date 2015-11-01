//
//  MessageModel.h
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    MessageModelG = 0,
    MessageModelJ
} MessageType;

@interface MessageModel : NSObject
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) MessageType type;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageModelWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)messageModel;
@end
