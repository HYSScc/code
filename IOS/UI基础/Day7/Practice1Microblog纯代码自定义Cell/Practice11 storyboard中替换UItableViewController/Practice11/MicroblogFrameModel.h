//
//  MicroblogFrameModel.h
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class MicroblogStatusModel;

@interface MicroblogFrameModel : NSObject
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect vipF;
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGRect pictureF;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) MicroblogStatusModel *microblogStatusModel;

+ (NSArray *)microblogFrameModel;

@end
