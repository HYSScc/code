//
//  FlagView.h
//  02-国旗自定义UIPickerView
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlagModel;

@interface FlagView : UIView
+ (instancetype)flagView;
@property (nonatomic, strong) FlagModel *model;
@end
