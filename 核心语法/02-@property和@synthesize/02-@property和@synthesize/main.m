//
//  main.m
//  02-@property和@synthesize
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import "Dog.h"
#import "Cat.h"

int main(int argc, const char * argv[]) {
    
//    Person *p = [Person new];
//    [p setAge:10];
//    
//    [p test];
    
//    Car *c = [Car new];
//    
//    c.speed = 100;
//    
//    [c test];
    
    //NSLog(@"%d", c.speed);
    
    
    
    Dog *d = [Dog new];
    
    d.age = 5;
    
    NSLog(@"%d", d.age);
    
    
//    Cat *c = [Cat new];
//    
//    c.age = 5;
//    NSLog(@"age=%d", c.age);
    return 0;
}






