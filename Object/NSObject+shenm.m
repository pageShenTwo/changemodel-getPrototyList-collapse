//
//  NSObject+shenm.m
//  ajs;fjl
//
//  Created by JBT on 2018/4/18.
//  Copyright © 2018年 JBT. All rights reserved.
//  在调用未实现的方法的时候会调用该分类避免崩溃 并收集崩溃log日志

#import "NSObject+shenm.h"
#import <objc/message.h>

@implementation NSObject (shenm)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation" // 重写父类方法会改变父类方法实现所以必须写这几个#pragma告诉编译器你想要做什么
// your override

-(id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;//定义转发接受者为空
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    //将此方法进行重写，在里这不进行任何操作，屏蔽会产生crash的方法调用
}


// 必须重写次方法来收集日志  并避免崩溃
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *str = NSStringFromSelector(aSelector);
    if ([str hasPrefix:@"_"]) {
        return nil;// 对私有方法不收集
    }
    NSString *message = @"sajefhlakhlnflhalkfd";
    NSMethodSignature *sin = [[self class] instanceMethodSignatureForSelector:@selector(shenlkaejgo:)];
    [self shenlkaejgo:message];
    return sin;
    
}
#pragma clang diagnostic pop
- (void)shenlkaejgo:(NSString *)string{
    NSLog(@"%@",string);
}

@end
