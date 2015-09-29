#include <stdio.h>

int main()
{
    int a = 0; // 一定要初始化
    
    while (a<=0) {
        // 1.提示输入
        printf("请输入一个正整数:");
        
        // 2.接收输入
        
        scanf("%d", &a);

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