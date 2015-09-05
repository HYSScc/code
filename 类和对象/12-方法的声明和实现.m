/*
计算机类
 方法：
 1> 返回 π
 2> 计算某个整数的平方
 3> 计算两个整数的和
*/
#import <Foundation/Foundation.h>
@interface JiSuanQi : NSObject

 
- (double)pai;
//oc方法中，一个参数对应一个冒号
//方法名叫：pingfang：（冒号也是方法名的一部分）
- (int)pingfang:(int)num;

//- (int)sum:(int)num1 :(int)num2;
//方法名：sumWithNum：andNum2：
- (int)sumWithNum1:(int)num1 andNum2:(int)num2;
@end

@implementation JiSuanQi
- (double)pai
{
    return 3.14;
}

- (int)pingfang:(int)num
{
    return num * num;
}


//- (int)sum:(int)num1 :(int)num2
//{
//    return num1 + num2;
//}
- (int)sumWithNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

@end
int main()
{
    JiSuanQi *jsq = [JiSuanQi new];
    
    int a = [jsq sumWithNum1:10 andNum2:5];
    
    //int a = [jsq sum:10 :5];
    
    //int a = [jsq pingfang:10];
    
    //double a = [jsq pai];
    
    NSLog(@"%i", a);

    return 0;
}