//
//  NSObject+prototyWithModel.m
//  ajs;fjl
//
//  Created by JBT on 2018/4/19.
//  Copyright © 2018年 JBT. All rights reserved.
// 根据字典生成属性列表   需要不断完善  现在只增加了NSString,NSNumber,NSDictionary

#import "NSObject+prototyWithModel.h"

@implementation NSObject (prototyWithModel)
+ (void)prototyWithModel:(NSDictionary *)dict{
    
    //@property (strong, nonatomic) NSString *name;
    NSMutableString *strM = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //[obj class]  是该属性是什么类型的值
        NSLog(@" key,obj ======= %@ %@",key,[obj class]);
        NSString *code = @"";
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]){
            code = [NSString stringWithFormat:@"@property (strong, nonatomic) NSString *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
             code = [NSString stringWithFormat:@"@property (assign, nonatomic) NSInteger %@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
             code = [NSString stringWithFormat:@"@property (strong, nonatomic) NSDictionary *%@;",key];
        }
        [strM appendFormat:@"\n%@\n",code];
    }];
    NSLog(@"%@",strM);
    
    
}
@end
