#include <stdio.h>

int main()
{
    // 1.输出信息
    printf("你的成绩是:");
    
    
    
    // 2.输入信息
    int score;
    scanf("%d", &score);
    
    // 3.判断信息
    if ( score>=90 && score<=100)
    {
        printf("等级为A\n");
    }
    else if ( score>=80)
    {
        printf("等级为B\n");
    }
    else if ( score>=70)
    {
        printf("等级为C\n");
    }
    else if ( score>=60)
    {
        printf("等级为D\n");
    }
    else
    {
        printf("等级为E\n");
    }

    
    
    return 0;
}