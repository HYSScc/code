#include <stdio.h>

int sum(int number1, int number2)
{
    int a = (number1-48) + (number2-48);
    printf("结果是%d\n", a);
    return 0;
}

int minus(int number1, int number2)
{
    int a = (number1-48) - (number2-48);
    printf("结果是%d\n", a);
    return 0;
}

int cheng(int number1, int number2)
{
    int a = (number1-48) * (number2-48);
    printf("结果是%d\n", a);
    return 0;
}

int chu(int number1, int number2)
{
    int a = (number1-48) / (number2-48);
    printf("结果是%d\n", a);
    return 0;
}

int main() {
    
    printf("请输入格式为a+b或a-b或a*b或a/b:\n");
    
    char name[4];
    
    scanf("%s", name);
    
    switch (name[1]) {
        case '+':
            printf("输入的算术是%s\n", name);
            sum(name[0], name[2]);
            break;
            
        case '-':
            printf("输入的算术是%s\n", name);
            minus(name[0], name[2]);
            break;
            
        case '*':
            printf("输入的算术是%s\n", name);
            cheng(name[0], name[2]);
            break;
            
        case '/':
            printf("输入的算术是%s\n", name);
            chu(name[0], name[2]);
            break;
    }
    
    
    
    return 0;
}
