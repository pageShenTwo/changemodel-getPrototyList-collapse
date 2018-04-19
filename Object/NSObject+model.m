//
//  NSObject+model.m
//  ajs;fjl
//
//  Created by JBT on 2018/4/19.
//  Copyright © 2018年 JBT. All rights reserved.
// 字典转模型   使用runtime时根据模型的成员变量去匹配字典   完成了二级转换  

#import "NSObject+model.h"
#import <objc/message.h>

@implementation NSObject (model)
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    id obj = [[self alloc] init];
    
    unsigned int count = 0;
    // 获取成员属性列表
    Ivar *ivar = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivarprototy = ivar[i];
        NSString *name =[NSString stringWithUTF8String:ivar_getName(ivarprototy)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivarprototy)];
        NSString *key = [name substringFromIndex:1];
        id value = dict[key];
        
        if ([value isKindOfClass:[NSDictionary class]] && ![type containsString:@"NS"]) {
            NSRange range = [type rangeOfString:@"\""];
            type = [type substringFromIndex:range.location +range.length];
            range = [type rangeOfString:@"\""];
            type = [type substringToIndex:range.location];
            Class newClass = NSClassFromString(type);
            if (newClass) {
               value = [newClass modelWithDict:value];
            }
        }
        
        if (value) {
            [obj setValue:value forKey:key];
        }
        
    }
    
    
    return obj;
}
@end
