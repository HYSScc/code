//
//  Contact.m
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.

#import "Contact.h"

@implementation Contact
// instancetype自动识别当前类的对象 == Contact *
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    Contact *contact = [[Contact alloc] init];
    
    contact.name = name;
    contact.phone = phone;
    
    return contact;
}
@end
