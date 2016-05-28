//
//  HelpHtmls.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpHtmls : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)helpHtmlsWithDict:(NSDictionary *)dict;
+ (NSArray *)helpHtmls;

@end
