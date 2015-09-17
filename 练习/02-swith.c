#include <stdio.h>

int main()
{
    printf("你的成绩是:");
    
    int score;
    scanf("%d", &score);
    
    switch (score/10){
        case 10:
        case 9:
            printf("你的成绩等级为A\n");
            break;
        case 8:
            printf("你的成绩等级为B\n");
            break;
        case 7:
            printf("你的成绩等级为C\n");
            break;
        case 6:
            printf("你的成绩等级为D\n");
            break;
        default:
            printf("你的成绩等级为E\n");
            break;
    
        }
    }