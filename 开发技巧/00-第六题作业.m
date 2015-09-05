/*
5.设计一盒类Point2D，用来表示二维平面中某个点
1> 属性
 * double x
 * double y
 
 2> 方法
 * 属性相应的set和get方法
 * 设计一个对象方法同时设置x和y
 * 设计一个对象方法计算跟其他点的距离
 * 设计一个类方法计算两个点之间的距离
 
 3> 提示
 * C语言的math.h中有个函数：double pow(double n, double m);计算n的m次方
 
 * C语言的math.h中有个函数：double sqrt(double n);计算根号n的值(对n进行开根)
*/
#import <Foundation/Foundation.h>
#import <math.h>

// 点
@interface Point2D: NSObject
{
    double _x; // x值
    double _y; // y值
}

// x值的getter和setter方法
- (void)setX:(double)x;
- (double)x;

// y值的getter和setter方法
- (void)setY:(double)y;
- (double)y;

// 同时设置x和y
- (void)setX:(double)x andY:(double)y;

// 计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other;
// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2;

@end

@implementation Point2D
// x值的getter和setter方法
- (void)setX:(double)x
{
    _x = x;
}
- (double)x
{
    return _x;
}

// y值的getter和setter方法
- (void)setY:(double)y
{
    _y = y;
}
- (double)y
{
    return _y;
}

//同时设置x和y
- (void)setX:(double)x andY:(double)y
{
    [self setX:x];
    [self setY:y];
    
    /*
    self->_x = x;
    self->_y = y;
    */
     
    /*
    _x = x;
    _y = y;
     */
}

// 设计计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other
{
    // （(x1-x2)的平方 + (y1-y2)的平方） 开根
    //return [Point2D distanceBetweenPoint1:self andPoint2:other];
    
    
    
    // x1-x2
    double xDelta = [self x] - [other x];
    //double xDelta = _x - [other x];
    //                _x - other->_x;
    //                self->_x - other->_x;
    
    // (x1-x2)的平方
    // C语言的math.h中有个函数：double pow(double n, double m);计算n的m次方
    double xDeltaPF = pow(xDelta, 2.0);
    
    // y1-y2
    double yDelta = [self y] - [other y];
    //double yDelta = _y - [other y];
    // (y1-y2)的平方
    // C语言的math.h中有个函数：double pow(double n, double m);计算n的m次方
    double yDeltaPF = pow(yDelta, 2.0);
    
    // 返回距离
    return sqrt(xDeltaPF + yDeltaPF);
    
    
}

// 计算两个点之间的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2
{
    
    
    return [p1 distanceWithOther:p2];
    
    /*
    // x1-x2
    double xDelta = [p1 x] - [p2 x];
    // (x1-x2)的平方
    // C语言的math.h中有个函数：double pow(double n, double m);计算n的m次方
    double xDeltaPF = pow(xDelta, 2.0);
    
    // y1-y2
    double yDelta = [p1 y] - [p2 y];
    // (y1-y2)的平方
    // C语言的math.h中有个函数：double pow(double n, double m);计算n的m次方
    double yDeltaPF = pow(yDelta, 2.0);
    
    // 返回距离
    return sqrt(xDeltaPF + yDeltaPF);
     */

}
@end

int main()
{
    Point2D *p1 = [Point2D new];
    // (10,15)
    [p1 setX:10 andY:15];
    
    Point2D *p2 = [Point2D new];
    // (13,19)
    [p2 setX:13 andY:11];
    
    //double d1 = [p1 distanceWithOther:p2];
    double d2 = [Point2D distanceBetweenPoint1:p1 andPoint2:p2];
    
    NSLog(@"%f", d2);

    return 0;
}



















