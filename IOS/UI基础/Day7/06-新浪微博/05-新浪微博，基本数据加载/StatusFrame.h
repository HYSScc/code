//
//  StatusFrame.h
//  05-新浪微博，基本数据加载
//
//  Created by tom-pc on 15/10/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class status;

/** 专门计算所有控件位置 */
@interface StatusFrame : NSObject
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect vipF;
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGRect pictureF;


/** 行高 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 所有控件的尺寸都可以通过Status来计算得出 */
@property (nonatomic, strong) status *status;

/** 所有的statusFrame数据数组 */
+ (NSArray *)statusFrames;

@end
