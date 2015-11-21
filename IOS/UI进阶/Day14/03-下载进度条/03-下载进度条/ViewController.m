//
//  ViewController.m
//  03-下载进度条
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@end

@implementation ViewController
// 监听方法
- (IBAction)valueChange:(UISlider *)sender {
    
    NSLog(@"%f", sender.value);
    
    _progressView.progress = sender.value;
}
@end
