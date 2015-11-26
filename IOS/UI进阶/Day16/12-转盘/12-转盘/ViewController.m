//
//  ViewController.m
//  12-转盘
//
//  Created by tom-pc on 15/11/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"

@interface ViewController ()
@property (nonatomic, weak) WheelView *wheelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建自定义View
    WheelView *wheel = [WheelView wheelView];
    
    wheel.center = self.view.center;
    
    [self.view addSubview:wheel];
    
    _wheelView = wheel;
}
- (IBAction)start:(id)sender {
    
    [_wheelView startRotating];
}
- (IBAction)stop:(id)sender {
    
    [_wheelView stopRotating];
}

@end
