

// 用位与&运算符判断变量的奇偶性

#include <stdio.h>

int main()
{
    int a = 2;
    
    //a%2==0 ? printf("偶数\n") : printf("奇数\n");
    
    //a%2 ? printf("奇数\n") : printf("偶数\n");
    
    //a&1 == 1 //奇数
    
    int b = a&1;  
    printf("%d\n", b);
    
    //a&0 == 0 //偶数
    
    return 0;
}