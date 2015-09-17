/*
提示用户输入一个正整数n，如果n=5，就输出下列图形，其他n值以此类推
 *****
 ****
 ***
 **
 *

*/

#include <stdio.h>

int main()
{
    // 1.定义一个变量存储用户输入的值
    int n = 0;
    
    
    // 2.判断n值是否合理
    while (n<=0) {
        printf("输入一个正整数:");
        
        scanf("%d", &n);
    }
    
    
    
    // 3.输出图形
    
    for ( int i = 0; i<n; i++)
    {
        //printf("***\n");
        for ( int a = 0; a<n-i; a++)
        {
            printf("*");
        }
        printf("\n");
    }
    
    
    
}