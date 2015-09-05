#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //char *_name;
    NSString *_name;
}
@end


int main()
{

    int age = 15;
    int no = 5;
    NSString *name = @"哈哈jack";
    
    
    // length方法算的时字数
    int size = [name length];
    
     NSLog(@"%d", size);
    
    // 创建oc字符串的另一种方式
    NSString *newstr = [NSString stringWithFormat:@"My age is %d and no is %d and name is %@", age, no, name];
    
    NSLog(@"---%@", newstr); // 输出字符串
     NSLog(@"---%ld", [newstr length]); // 输出字符串的字数
    
    
    /*
     // 简单的创建字符串的方式
    //NSString *str = @"itcast";
     
     char *name = "itcast";
    
    //NSLog(@"%@", str);
     
     NSLog(@"%s", name);
    */
    return 0;
}