#include <stdio.h>

int main()
{
    // 1.输出信息
    printf("你输入的月份是:");

    // 2.输入信息
    int month;
    scanf("%d", &month);
    
    // 3.判断信息
    if (month>=10 && month<=12)
    {
        printf("季节是冬天\n");
    }
    else if (month>=7 && month<=9)
    {
        printf("季节是秋天\n");
    }
    else if (month>=4 && month<=6)
    {
        printf("季节是夏天\n");
    }
    else if (month>=1 && month<=3)
    {
        printf("季节是春天\n");
    }

    return 0;
}