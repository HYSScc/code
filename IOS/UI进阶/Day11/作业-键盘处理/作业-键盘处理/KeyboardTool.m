//
//  KeyboardTool.m
//  作业-键盘处理
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "KeyboardTool.h"

@interface KeyboardTool()
- (IBAction)previous:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)down:(id)sender;

@end

@implementation KeyboardTool

- (IBAction)previous:(id)sender {
}

- (IBAction)next:(id)sender {
}

- (IBAction)down:(id)sender {
}

+ (instancetype)keyboardTool
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KeyboardTool" owner:nil options:nil] lastObject];
}
@end
