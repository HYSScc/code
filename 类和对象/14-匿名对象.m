#import <Foundation/Foundation.h>
@interface Car : NSObject
{   @public
    int speed;
}
- (void)run;
@end
@implementation Car
- (void)run
{
    NSLog(@"速度为%d的车子跑起来了", speed);
}
@end
int main()
{
//    Car *c;
//    c = [Car new];
//    c->speed = 250;
//    
//    [c run];
    //Car *c = [Car new];
    
    //不要写类似匿名对象这样的代码
    //只要求能说出输出结果
    [Car new]->speed = 300;
    [[Car new] run];
    
    return 0;
}