//
//  ViewController.m
//  02-按钮
//
//  Created by tom-pc on 15/9/26.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 声明按钮对象
@property (weak, nonatomic) IBOutlet UIButton *iconButton;


@end

@implementation ViewController




// 向上移动
- (IBAction)top:(id)sender
{
    // 修改位置可以用frame
    // 在OC中，不允许直接修改对象的结构体属性的成员
    // 但是允许修改结构体属性的成员
   // self.iconButton.frame.origin.y = 20;
    
    // 如果要修改对象的结构体属性，需要三个步骤
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.y -= 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
    
}

// 向下移动
- (IBAction)bottom:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.y += 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}

// 向左移动
- (IBAction)left:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.x -= 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}

// 向右移动
- (IBAction)right:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.x += 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}



@end
