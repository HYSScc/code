//
//  MicroblogStatusModel.h
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    NotMicroblogVip = 0,
    IsMicroblog 
} MicroblogVip;

@interface MicroblogStatusModel : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) MicroblogVip vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)microblogModelWithDict:(NSDictionary *)dict;
@end
