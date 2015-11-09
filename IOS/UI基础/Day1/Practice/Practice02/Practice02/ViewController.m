//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

- (IBAction)touch:(UIButton *)button
{
    
}

- (IBAction)topButton:(id)sender {
    
    CGRect frame = self.iconButton.frame;
    
    frame.origin.y -= 20;
    self.iconButton.frame = frame;
}
//- (IBAction)leftButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.x -= 20;
//    self.iconButton.frame = frame;
//}
//- (IBAction)bottomButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.y += 20;
//    self.iconButton.frame = frame;
//}
//- (IBAction)rightButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.x += 20;
//    self.iconButton.frame = frame;
//}

@end
