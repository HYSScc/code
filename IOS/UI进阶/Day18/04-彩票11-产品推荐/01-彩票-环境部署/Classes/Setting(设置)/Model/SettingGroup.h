//
//  SettingGroup.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;

@property (nonatomic, strong) NSArray *items; // 每一行的内容

@end
