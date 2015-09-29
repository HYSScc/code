

#include <stdio.h>

int main()
{
    int a = 10;
    int b = 11;
    
    
//    int temp;
//    
//    temp = a;
//    a = b;
//    b = temp;
    
    a = b - a;
    b = b - a;
    a = b + a;
    
    
    printf("%d %d\n", a, b);
    
    return 0;
}