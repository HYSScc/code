

#import <Foundation/Foundation.h>

BOOL test()
{
    return NO;
}

int main()
{

    BOOL b = YES; // 定义一个变量
    
    BOOL b2 = NO;
    
    BOOL b3 = 1;//  YES
    
    BOOL b4 = 0;//  NO
    
    
    //NSLog(@"%i",b);  // 输出变量
    
    NSLog(@"%i", test());
    
    return 0;
}