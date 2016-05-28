//
//  SaveTool.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveTool : NSObject

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

+ (nullable id)objectForKey:(NSString *)defaultName;

@end
