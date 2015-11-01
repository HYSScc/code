//
//  Person.h
//  05-通知
//
//  Created by tom-pc on 15/10/31.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)person:(NSString *)noti;

@end
