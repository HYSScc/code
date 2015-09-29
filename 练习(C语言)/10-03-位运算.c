
// 写一个函数，用来输出整数在内存中的二进制形式

#include <stdio.h>

void printBinary(int number)
{
    // 9在内存中 0000 0000 0000 0000 0000 0000 0000 1001
    
    // 记录现在挪到第几位
    // sizeof（number）*8 - 1
    int temp = (sizeof(number)<<3) - 1;
    
    while (temp>=0) {
        int value = number>>temp & 1;
        printf("%d", value);
        temp--;
        
        if ((temp+1)%4==0)
        {
            printf(" ");
        }
    }
    
    printf("\n");
}

int main()
{
    
    int a = 15;
    
    printBinary(a);
    
    return 0;
}