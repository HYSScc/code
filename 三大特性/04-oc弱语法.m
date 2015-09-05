
#import <Foundation/Foundation.h>

@interface Person : NSObject

@end

@implementation Person

@end

int main()
{
    Person *p = [Person new];
    
    //oc是在运行过程中才会检测对象有没有实现相应的方法
    [p test];

    return 0;
}
