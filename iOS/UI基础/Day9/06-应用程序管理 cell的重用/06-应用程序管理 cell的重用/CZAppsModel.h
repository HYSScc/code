//
//  CZAppsModel.h
//  Cell的重用
//
//  Created by S.J on 14-8-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAppsModel : NSObject

@property (nonatomic, copy)NSString *size;

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *download;

@property (nonatomic, copy)NSString *icon;
// 添加的属性
@property (nonatomic,assign)BOOL isDownload;

+ (instancetype)appsWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

