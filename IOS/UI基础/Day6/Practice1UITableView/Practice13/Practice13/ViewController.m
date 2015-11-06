//
//  ViewController.m
//  Practice13
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *carGroupModelList;
@end

@implementation ViewController

- (NSArray *)carGroupModelList
{
    if (_carGroupModelList == nil) {
        _carGroupModelList = [CarGroup carGroup];
    }
    return _carGroupModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.carGroupModelList);
    
}


@end
