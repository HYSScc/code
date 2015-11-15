//
//  EditViewController.h
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;
@class EditViewController;
@protocol EditViewControllerDalegate <NSObject>

@optional
- (void)editViewController:(EditViewController *)edit didUpdateModelContact:(Contact *)contact;

@end
@interface EditViewController : UIViewController
@property (nonatomic, strong) Contact *contact;
@property (nonatomic, weak) id<EditViewControllerDalegate> delegate;
@end
