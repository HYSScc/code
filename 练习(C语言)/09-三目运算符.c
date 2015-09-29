// 比较三个数值，取出最大值

#include <stdio.h>

int main()
{
    int a = 10;
    int b = 23;
    int c = 0;
    
    // 两两比较
    int abMax = a>b ? a : b;
    
    int d = c>abMax ? c : abMax;
    
    printf("%d\n", d);
    
    return 0;
}