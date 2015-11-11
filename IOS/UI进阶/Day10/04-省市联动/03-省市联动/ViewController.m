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

@property (nonatomic, assign) NSInteger provinceIndex; // 选中城市的索引
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
//        ProvinceModel *model = self.provinceList[0];
        ProvinceModel *model = self.provinceList[self.provinceIndex]; // 根据索引显示相应行数
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
        // 默认给一个初始大小
        label = [[UILabel alloc] init];
    }
    // 显示省份
    if (component == 0) {
        ProvinceModel *model = self.provinceList[row]; // 行
        label.text = model.name;
        
        // 设置bounds
//        label.bounds = CGRectMake(0, 0, 150, 50);
        label.backgroundColor = [UIColor grayColor];
    }else{
        // 显示城市
        // 默认显示第一个城市
//        ProvinceModel *model = self.provinceList[0];
        ProvinceModel *model = self.provinceList[self.provinceIndex]; // 根据索引显示相应内容
        label.text = model.cities[row];
        
        // 设置bounds
//        label.bounds = CGRectMake(0, 0, 150, 50);
        label.backgroundColor = [UIColor redColor];
    }
    return label;
}
// didselect方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        // 1.省份选中
        ProvinceModel *model = self.provinceList[row];
        NSLog(@"选中省份 %@", model.name); // 前面有中文，无法显示name
        
        // 2.更改当前选中省份索引
        self.provinceIndex = row;
        
        // 3.刷新右边的数据
        [pickerView reloadComponent:1];
        
        // 4.重新设置右边的数据显示第一行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}
// cell宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        // 省得label的宽度为150
        return 150;
    }else{
        // 市的label的宽度为100
        return 100;
    }
}
// cell的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
@end
