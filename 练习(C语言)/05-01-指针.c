#include <stdio.h>


int sumAndMinus();

int main()
{
    int a = 1;
    int b = 3;
    
    
    //定义一个变量接收和
    int he;
    
    //定义一个变量接收差
    int cha;
    
    //调用函数
    he =  sumAndMinus(a, b, &cha);
    
    printf("%d\n%d\n", he, cha);
    
    return 0;
}

int sumAndMinus(int n1, int n2, int *n)
{
    *n = n1 - n2;
    
    return n1 + n2;
}