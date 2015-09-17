/*
输出100以内所有三的倍数的个数
*/

#include <stdio.h>

int main()
{
    int count = 0; // 记录三的倍数的个数
    
    int number = 0; // 记录检查的当前数值
    
    while (number < 10) {
        number++;
        
        if (number%3 == 0) {
            count++;
        }
    }
    
    printf("个数是%d\n", count);

    return 0;
}