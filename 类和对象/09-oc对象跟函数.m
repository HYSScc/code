
#import <Foundation/Foundation.h>
@interface Car : NSObject
{   @public
    int wheels;
    int speed;

}

- (void)run;

@end


@implementation Car

- (void)run
{

    NSLog(@"%d个轮子，速度为%dkm/h的车子跑起来", wheels,speed);
}

@end

void test(int w, int s)
{
    w = 20;
    s = 200;
}

void test1(Car *newC)
{
    newC->wheels = 5;

}

void test2(Car *newC)
{
    Car *c2 = [Car new];
    c2->wheels = 5;
    c2->speed = 300;
    
    newC = c2;
    newC->wheels = 6;



}


int main()
{
    
    Car *c = [Car new];
    c->wheels = 4;
    c->speed = 250;
    
    //test(c->wheels, c->speed);
    //test1(c);
    test2(c);
    
    [c run];
    return 0;
}