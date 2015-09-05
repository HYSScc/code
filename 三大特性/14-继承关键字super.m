/*
 僵尸
 
 跳跃僵尸、舞王僵尸、铁桶僵尸
 
 */
/*
 super的作用
 1.直接调用父类中的某个方法
 2.super处在对象方法中，那么就会调用父类的对象方法
   super处在类方法中，那么就会调用父类的类方法
 3.使用场合：子类重写父类方法时想保留父类的一些方法行为
 */


// 僵尸类
#import <Foundation/Foundation.h>
@interface Zoombie : NSObject
- (void)walk;

+ (void)test;
- (void)test;
@end

@implementation Zoombie
- (void)walk
{
    NSLog(@"往前挪两步****");
}

+ (void)test
{
    NSLog(@"Zoombie+test");
}

- (void)test
{
    NSLog(@"Zoombie-test");
}
@end

// 跳跃僵尸
@interface JumpZoombie : Zoombie
+ (void)haha;
- (void)haha2;
@end

@implementation JumpZoombie
- (void)walk
{
    // 跳两下
    NSLog(@"跳两下");
    
    //走两下
    //NSLog(@"往前挪两步");
    //[self walk]; // 死循环
    // 走两下（直接调用父类的walk方法）
    [super walk];
    
}

+ (void)haha
{
    [super test];
}

- (void)haha2
{
    [super test];
}
@end







int main()
{
 //   [JumpZoombie haha];
    JumpZoombie *j = [JumpZoombie new];
    
    [j haha2];

    return 0;
}