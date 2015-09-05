/*1.设计一个方法，用来和其他车比较车速，返回车速的差距；
  2.如果本车速度快，就返回1，如果本车速度慢，就返回-1，速度相同就返回0
 */

#import <Foundation/Foundation.h>
@interface Car : NSObject
{   @public
    int speed;
}

- (int)compareSpeedWithOther:(Car *)other;


@end

@implementation Car
- (int)compareSpeedWithOther:(Car *)other
{
    //speed
    //other->speed
    //返回当前这辆车和other这辆车的速度差距
    return speed - other->speed;
}
@end

int main()
{
    Car *c1 = [Car new];
    c1->speed = 300;
    
    Car *c2 = [Car new];
    c2->speed = 250;
    
    int a = [c1 compareSpeedWithOther:c2];
    NSLog(@"%i", a);
    return 0;
}