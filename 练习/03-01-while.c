/*
 提示用户输入一个正整数n，计算1+2+3+···+n的和
*/

#include <stdio.h>

int main()
{
    // 1.提示输入
    printf("请输入一个正整数:");
    
    // 2.接收输入
    int a;
    scanf("%d", &a);
    
    if (a<=0) {
        printf("叫你输正整数\n");
        return 0;
    }
    
    // 3.计算
    int number = 0;
    int sum = 0;
    
    while (number < a) {
        
        number++;
        sum += number;
        
        
    }
    
    printf("%d\n", sum);

    
    
    return 0;
}