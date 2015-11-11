//
//  ViewController.m
//  03-省市联动
//
//  Created by tom-pc on 15/11/11.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceModel.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *provinceList;
@end

@implementation ViewController

- (NSArray *)provinceList
{
    if (_provinceList == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil]];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[ProvinceModel provinceWithDict:dict]];
        }
        _provinceList = arrayM;
    }
    return _provinceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.provinceList);
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinceList.count;
    } else {
        ProvinceModel *model = self.provinceList[0];
        return model.cities.count;
    }
}

#pragma mark - 代理方法
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = nil;
    // 循环
    if (view != nil) {
        label = (UILabel *)view;
    }else{
        label = [[UILabel alloc] init];
    }
    // 显示省份
    if (component == 0) {
        ProvinceModel *model = self.provinceList[row]; // 行
        label.text = model.name;
    }else{
        // 显示城市
        // 默认显示第一个城市
        ProvinceModel *model = self.provinceList[0];
        label.text = model.cities[row];
    }
    return label;
}
@end
