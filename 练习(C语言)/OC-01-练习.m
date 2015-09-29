
// 设计一个方法，用来和其他汽车比较车速，返回车速的差距；
// 如果本车速度快，则返回1；反之。相等返回0；
#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    @public
    int speed;
}

- (int)compareSpeedWithOther:(Car *)other;

@end

@implementation Car

- (int)compareSpeedWithOther:(Car *)other
{
    int  s = speed - other->speed;
    
    if (s > 0) {
        return 1;
    }
    else if (s < 0)
    {
        return -1;
    }
    else if (s == 0)
    {
        return 0;
    }
    return 0;
}

@end

int main()
{
    Car *c1 = [Car new];
    c1->speed = 100;
    
    Car *c2 = [Car new];
    c2->speed = 200;
    
    int result = [c1 compareSpeedWithOther:c2];
    
    NSLog(@"%i", result);
    
    return 0;
}