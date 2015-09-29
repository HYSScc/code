// 1.提示用户输入信息，格式。

// 2.接收用户输入的数据

// 3.计算

#include <stdio.h>

int sum(int number1, int number2)
{
    int a = number1 + number2;
    printf("%d\n", a);
    return 0;
}

int minus(int number1, int number2)
{
    return number1 - number2;
}

int cheng(int number1, int number2)
{
    return number1 * number2;
}

int chu(int number1, int number2)
{
    return number1 / number2;
}


int main()
{
    
    printf("请输入格式为a+b:\n");
    
//    int a;
//    int b;
    char name[20];
   
//    printf("输入的算术是%s\n", name);
//    
//    int length = sizeof(name)/sizeof(char);
//    
//    int fuhaoOfArray(char array[], int length){
//    
//        char fuhao = array[0];
//        
//        for (int i = 0; i<length; i++)
//            {
//                
//            if (fuhao == '+') {
//                
//                int result = sum(a, b);
//                
//            }
//            else if (fuhao == '-')
//            {
//                int result = minus(a, b);
//            }
//            else if (fuhao == '*')
//            {
//                int result = cheng(a, b);
//            }
//             else if (fuhao == '/')
//             {
//                 int result = chu(a, b);
//             }
//                 
//            
//            
//        }
//        
//        return 0;
//    }

    
    
    
    
    
    
//    scanf("%d+%d", &a, &b);
//    printf("请输入格式为a*b:\n");
//    scanf("%d*%d", &a, &b);
//    printf("请输入格式为a-b:\n");
//    scanf("%d-%d", &a, &b);
//    printf("请输入格式为a/b:\n");
//    scanf("%d/%d", &a, &b);
//    
//    while ('+') {
//        scanf("%d+%d", &a, &b);
//        int result = calculate(a, b);
//        printf("计算结果是%d\n", result);
//        return 0;
//    }
    
    switch (scanf("%s", name)) {
        case '+':
            printf("输入的算术是%s\n", name);
            sum(name[0], name[2]);
            break;
        
        case '-':
            minus(name[0], name[2]);
            break;
        
        case '*':
            cheng(name[0], name[2]);
            break;
        
        case '/':
            chu(name[0], name[2]);
            break;
      }
    
    
    //printf("请输入运算符号:\n");
//    char b;
//    scanf("%c", &b);

    
    
    
    
    
    return 0;
}