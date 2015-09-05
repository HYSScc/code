
/*
 方法和函数的区别：
 1.对象方法都是以减号 －
 2.对象方法的声明必须写在@interface和@end之间
  对象方法的实现必须写在@implementation和@end之间
 3.对象方法只能由对象来调用
 4.对象方法归类\对象所有
 
 函数
 1.函数能写在文件中的任意位置（@interface和@end之间），函数归文件所有
 2.函数调用不依赖于对象
 3.函数内部不能直接通过成员变量名访问某个对象的成员变量

*/
#import <Foundation/Foundation.h>

@interface Car : NSObject
{   //int wheels＝4； 不允许在这里初始化
    //static int wheels； 不能随便讲成员变量当作c语言中的变量来使用
    @public
    int wheels;

}
- (void)run;

@end

@implementation Car


void test()
{

    NSLog(@"调用了test函数");
    
}

- (void)run
{
    test();
    NSLog(@"%d个轮子的车跑起来了", wheels);
}


@end



int main()
{
    Car *c = [Car new];
    
    c->wheels = 4;
    
    [c run];
    return 0;
}