//
//  PaintView.m
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "PaintView.h"
#import "PaintPath.h"

@interface PaintView()
@property (nonatomic, strong) UIBezierPath *path; // 路径touchBegin方法中生成，方便其他方法调用
@property (nonatomic ,strong) NSMutableArray *paths; // 保存路径地数组，解决画第二条线时，就清空上一条线。
@end

@implementation PaintView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
#warning 
- (CGPoint)pointWithTouches:(NSSet *)touches
{   // 获取点击
    UITouch *touch = [touches anyObject];
    // 返回点位置
    return [touch locationInView:self];
}
#warning 确定路径起点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 创建路径
    PaintPath *path = [PaintPath paintPathWithLineWidth:_width color:_color startPoint:pos];
//    [path.color set]; // 无效
    _path = path;
    [self.paths addObject:path]; // 这里要用self.paths，调用set方法。如果_paths将是空值。
    
}
#warning 确定路径终点
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 确定终点
    [_path addLineToPoint:pos];
    
    // 重绘
    [self setNeedsDisplay];
}


// 把之前的全部清空 重新绘制
// 一般有drawRect方法就需要重绘
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (!self.paths.count) return; // 添加，如果没有数值就直接返回
    
    // 渲染
    for (PaintPath *path in _paths) {
        
        if ([path isKindOfClass:[UIImage class]]) { // UIImage
            UIImage *image = (UIImage *)path; // 如果path是UIImage 就把它转化成UIImage
            [image drawAtPoint:CGPointZero];
        }else{
            [path.color set];
            [path stroke];

        }
        
    }
}

// 默认初始化线宽为0
// 加载XIB完毕后就调用
- (void)awakeFromNib
{
    // 初始化
    self.width = 2;
}

#warning 方法实现
- (void)clearScreen
{
    [self.paths removeAllObjects];
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)undo
{
    [self.paths removeLastObject];
    // 重绘
    [self setNeedsDisplay];
}


- (void)setImage:(UIImage *)image
{
    _image = image;
    // 将图片加到数组
    [self.paths addObject:image];
    // 重绘
    [self setNeedsDisplay];
}

@end
