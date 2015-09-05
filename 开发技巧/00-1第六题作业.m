
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


/*
 6.设计一个类Circle,用来表示二维平面中的圆
 1> 属性
 * double _radius (半径)
 * Point2D *_point （圆心）
 
 2> 方法
 * 属性相应的set和get方法
 * 设计一个对象判断跟其他圆是否重叠（重叠返回YES，否则返回NO）
 * 设计一个类方法判断两个圆是否重叠（重叠返回YES，否则返回NO）
 */


// 圆
@interface Circle : NSObject
{
    // 半径
    double _radius;
    // 圆心
//    double _x;
//    double _y;
    Point2D *_point; // 组合
}

// 半径的setter和getter方法
- (void)setRadius:(double)radius;
- (double)radius;

// 圆心的setter和getter方法
- (void)setPoint:(Point2D *)point;
- (Point2D *)point;

// 设计一个对象判断跟其他圆是否重叠（重叠返回YES，否则返回NO）
// 返回值时BOOL类型，方法名一般都以is开头
- (BOOL)isInteractWithOther:(Circle *)other;

// 设计一个类方法判断两个圆是否重叠（重叠返回YES，否则返回NO）
+ (BOOL)isInteractBetweenCircle1:(Circle *)c1 andCircle2:(Circle *)c2;
@end

@implementation Circle
// 半径的setter和getter方法
- (void)setRadius:(double)radius
{
    _radius = radius;
}
- (double)radius
{
    return _radius;
}

// 圆心的setter和getter方法
- (void)setPoint:(Point2D *)point
{
    _point = point;
}
- (Point2D *)point
{
    return _point;
}

// 设计一个对象判断跟其他圆是否重叠（重叠返回YES，否则返回NO）
- (BOOL)isInteractWithOther:(Circle *)other
{
    // 如果两个圆心的距离 < 两个圆的半径和 ， 重叠
    // 如果两个圆心的距离 > 两个圆的半径和 ， 不重叠

    Point2D *p1 = [self point];
    Point2D *p2 = [other point];
    // 圆心之间的距离
    double distance = [p1 distanceWithOther:p2];
    
    // 半径和
    double radiusSum = [self radius] + [other radius];
    
    /*
    if (distance < radiusSum) {
        return 1;
    }
    else
    {
        return 0;
    }
    */
    
    return distance < radiusSum; // 关系运算符，关系成立返回1，关系不成立返回0
    
}

// 设计一个类方法判断两个圆是否重叠（重叠返回YES，否则返回NO）
+ (BOOL)isInteractBetweenCircle1:(Circle *)c1 andCircle2:(Circle *)c2
{
    return [c1 isInteractWithOther:c2];
}

@end


// 只有利用类名调用类方法的时候，不需要在类名后面写*
// 其他情况下，类名后面统一加上一个*


int main()
{
    // 圆对象
    Circle *c1 = [Circle new];
    //设置半径
    [c1 setRadius:1];
    
//    //垃圾代码
      // [[c1 point] setX:20];
      // 分解解释
//    Point2D *pp = [c1 point]; // [c1 point]的取值为0，所以给Point2D *类型的指针pp，赋的值为0；说明pp不指向任何对象。
//    [pp setX:20]; // 然后调用setX方法是完全没有意义，因为[0 setX:20];无法调用任何方法
    
    
    // 创建圆心对象
    Point2D *p1 = [Point2D new];
    [p1 setX:10 andY:15];
    // 先设置圆心
    [c1 setPoint:p1];
    
    [[c1 point] setX:15]; // 已经创建对象后，可以调用setX:方法
    // c1 半径：5 圆心：（15， 15）
    
    
    // 圆对象
    Circle *c2 = [Circle new];
    // 设置圆的半径
    [c2 setRadius:2];
    
    // 创建圆心对象
    Point2D *p2 = [Point2D new];
    [p2 setX:12 andY:19];
    // 设置圆心
    [c2 setPoint:p2];
    // c2 半径：2 圆心：（12， 19）
    
    //BOOL b1 = [c1 isInteractWithOther:c2];
    BOOL b2 = [Circle isInteractBetweenCircle1:c1 andCircle2:c2];
    
    NSLog(@"%d", b2);
    
    /*
    Point2D *p1 = [Point2D new];
    // (10,15)
    [p1 setX:10 andY:15];
    
    Point2D *p2 = [Point2D new];
    // (13,19)
    [p2 setX:13 andY:11];
    
    //double d1 = [p1 distanceWithOther:p2];
    double d2 = [Point2D distanceBetweenPoint1:p1 andPoint2:p2];
    
    NSLog(@"%f", d2);
     */
    
    return 0;
}
