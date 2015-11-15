//
//  AddViewController.h
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.

#import <UIKit/UIKit.h>
#import "ContactsTableViewController.h"
@class AddViewController, Contact;
@protocol AddViewControllerDelegate <NSObject>
@optional
- (void)addViewController:(AddViewController *)add didAddContact:(Contact *)contact;

@end

@interface AddViewController : UIViewController
@property (nonatomic, strong) ContactsTableViewController *contact;

@property (nonatomic, weak) id<AddViewControllerDelegate> delegate;
@end
