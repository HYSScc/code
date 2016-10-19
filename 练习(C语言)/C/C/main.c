//
//  main.c
//  C
//
//  Created by tom-pc on 2016/10/11.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

#include "stdio.h"

int main(){
    
//    int a,b,c;
//    a = 10;
//    b = 11;
//    c = a + b;
//    
//    char cha = 'q';
//    
//    float d = 3.14;
//    
//    if(a<b){
//        printf("a比b小\n");
//    }
//    
//    if (a%2==0) {
//        printf("是偶数");
//    }else{
//        printf("奇数");
//    }
//    
//    printf("%d\n%c\n%f\n", a, cha, d);
//
//    printf("hello,world\n");
    
//    int i = 1, sum = 0;
    
//    while (i < 6) {
//        sum = sum + 3 * i;
//        i++;
//    }
//    
//    printf("sum的值%d\n", sum);
    
//    do{
//        sum = sum + 3 * i;
//        i++;
//    }while (i < 6);
//    
//    printf("苹果的总数:%d\n", sum);
    
//    int i = 1;
//    
//    for(i = 1; i < 16; i++){
//        if((i % 2) == 1){
//            printf("%d\n", i);
//        }
//    }

// 99乘法表
/*
    int i,j;
    for(i = 1; i < 8; i++){

        for(j = 1; j <= i; j++){
            
            printf("*");
        }
        printf("\n");
    }
*/
    
/* 数组
    char array[] = {'t', 'o', 'm', 'c', 'a', 't'};
    int i = 0;
    for(i = 0; i < 6; i++)
    {
        printf("%c\n", array[i]);
    }
    
*/
    /*数字我最大
   
    int i, max, a[5]={10,5,20,31,4};
    max = a[0];
    for(i = 0;i < 5;i++)
        if(a[i] > max)
            max = a[i];
    printf("maxnum=%d\n", max);
    
    */
    
    /*字符串和字符数组的区别
    char cArr[] = {'I', 'L', 'O', 'V', 'E', 'C'};
    char sArr[] = "ilovec";
    int i = sizeof(cArr);
    int j = sizeof(sArr);
    printf("字符数组长度:%d,字符串的长度:%d\n", i,j);
    */
    
    
    /*二维数组
    int a[3][4]={{1,2,3,4},{5,6,7,8},{9,10,11,12}};
    int sum = 0, v = 0,i,j;
    
    for(i = 0; i < 3; i++){
    
        for(j = 0; j < 4; j++){
            sum = sum + a[i][j];
        }
    }
    v = sum / 12;
    printf("这些数的和是:%d,这些数的平均数是:%d\n", sum, v);
    */
    
    
    /*指针
    int a = 0, *p1 = &a;
    float b = 0.11, *p2 = &b;
    char c = 'a', *p3 = &c;
    
    printf("a=%d, b=%f, c=%d", *p1, *p2, *p3);
    
    */
    
    /*使用指针
    
    int x = 100, y = 200, *p1 = &x, *p2 = &y;
    printf("x和y的和是:%d\n", *p1 + *p2);// *p1 代表值， p1代表地址；
    
    */
    
    
    /*指针奇妙
    
    int *p1,*p2, a = 10, b = 20, c;
    p1 = &a;
    p2 = &b;
    if(a<b)
    {
        c = a;
        a = b;
        b = c;
    }
    printf("a=%d, b=%d\n", a,b);
    printf("最大值=%d,最小值=%d\n", *p1, *p2);
     
    */
    
    /* 野指针 和 NULL
    int *p;
    p = (int *)malloc(1);
    if(p == NULL){
        printf("内存分配失败");
        exit(-1);
    }
    *p = 100;
    printf("p指针中的内容=%d", *p);
    free(p); // 内存释放
    
    */
    
    /*数组指针
    int a[5], *p = a,i;
    for(i = 0; i < 5; i++){
        *p = i;
        p++;
    }
    p = p - 5;
    for(i = 0; i < 5;i++, p++)
        printf("%d\n", *p);
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}