/*
 设计一个计算机类
 * 求和
 * 求平均值
*/

#import <Foundation/Foundation.h>

//工具类：基本没有任何成员变量，里面的方法基本都是类方法
@interface JiSuanQi : NSObject
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2;

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2;

//- (int)sumOfNum1:(int)num1 andNum2:(int)num2;
//
//- (int)averageOfNum1:(int)num1 andNum2:(int)num2;

@end

@implementation JiSuanQi
+ (int)sumOfNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

+ (int)averageOfNum1:(int)num1 andNum2:(int)num2
{
    int sum = [JiSuanQi sumOfNum1:num1 andNum2:num2];
    return sum / 2;
}


//- (int)sumOfNum1:(int)num1 andNum2:(int)num2
//{
//    return num1 + num2;
//}
//
//- (int)averageOfNum1:(int)num1 andNum2:(int)num2
//{
//    return (num1 + num2)/2;
//}
@end

int main()
{
    //int a = [JiSuanQi sumOfNum1:10 andNum2:13];
    
    int a = [JiSuanQi averageOfNum1:10 andNum2:13];
    
    NSLog(@"%d", a);

    return 0;
}

