# -
字典转模型
#import "NSObject+model.h"

personOne * p = [personOne modelWithDict:dict];

根据字典生成属性列表
#import "NSObject+prototyWithModel.h"
NSString *path = [[NSBundle mainBundle] pathForResource:@"person" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *dict1 = dict[@"sonperson"];
    [NSObject prototyWithModel:dict1];
    
 #import "NSObject+shenm.h"
 直接导入文件就能够避免当调用未实现的方法而崩溃的问题
 
    
    
